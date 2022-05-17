/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */
#include "xparameters.h"

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xv_tpg.h"

#include "xgpio.h"

void send_bits(uint16_t data, uint16_t count);
void write(uint16_t command);
void setup_lcd(void);
void delay(unsigned int time);

#define TFT_MOSI 2
#define TFT_SCK 1
#define TFT_CS 4
#define TFT_BL 8

int32_t commands[] = {
    0x0ff, 0x1ff, 0x198, 0x106, 0x104, 0x101, 0x008, 0x110,
    0x021, 0x109, 0x030, 0x102, 0x031, 0x100, 0x040, 0x110,
    0x041, 0x155, 0x042, 0x102, 0x043, 0x109, 0x044, 0x107,
    0x050, 0x178, 0x051, 0x178, 0x052, 0x100, 0x053, 0x16d,
    0x060, 0x107, 0x061, 0x100, 0x062, 0x108, 0x063, 0x100,
    0x0a0, 0x100, 0x0a1, 0x107, 0x0a2, 0x10c, 0x0a3, 0x10b,
    0x0a4, 0x103, 0x0a5, 0x107, 0x0a6, 0x106, 0x0a7, 0x104,
    0x0a8, 0x108, 0x0a9, 0x10c, 0x0aa, 0x113, 0x0ab, 0x106,
    0x0ac, 0x10d, 0x0ad, 0x119, 0x0ae, 0x110, 0x0af, 0x100,
    0x0c0, 0x100, 0x0c1, 0x107, 0x0c2, 0x10c, 0x0c3, 0x10b,
    0x0c4, 0x103, 0x0c5, 0x107, 0x0c6, 0x107, 0x0c7, 0x104,
    0x0c8, 0x108, 0x0c9, 0x10c, 0x0ca, 0x113, 0x0cb, 0x106,
    0x0cc, 0x10d, 0x0cd, 0x118, 0x0ce, 0x110, 0x0cf, 0x100,
    0x0ff, 0x1ff, 0x198, 0x106, 0x104, 0x106, 0x000, 0x120,
    0x001, 0x10a, 0x002, 0x100, 0x003, 0x100, 0x004, 0x101,
    0x005, 0x101, 0x006, 0x198, 0x007, 0x106, 0x008, 0x101,
    0x009, 0x180, 0x00a, 0x100, 0x00b, 0x100, 0x00c, 0x101,
    0x00d, 0x101, 0x00e, 0x100, 0x00f, 0x100, 0x010, 0x1f0,
    0x011, 0x1f4, 0x012, 0x101, 0x013, 0x100, 0x014, 0x100,
    0x015, 0x1c0, 0x016, 0x108, 0x017, 0x100, 0x018, 0x100,
    0x019, 0x100, 0x01a, 0x100, 0x01b, 0x100, 0x01c, 0x100,
    0x01d, 0x100, 0x020, 0x101, 0x021, 0x123, 0x022, 0x145,
    0x023, 0x167, 0x024, 0x101, 0x025, 0x123, 0x026, 0x145,
    0x027, 0x167, 0x030, 0x111, 0x031, 0x111, 0x032, 0x100,
    0x033, 0x1ee, 0x034, 0x1ff, 0x035, 0x1bb, 0x036, 0x1aa,
    0x037, 0x1dd, 0x038, 0x1cc, 0x039, 0x166, 0x03a, 0x177,
    0x03b, 0x122, 0x03c, 0x122, 0x03d, 0x122, 0x03e, 0x122,
    0x03f, 0x122, 0x040, 0x122, 0x052, 0x110, 0x053, 0x110,
    0x0ff, 0x1ff, 0x198, 0x106, 0x104, 0x107, 0x018, 0x11d,
    0x017, 0x122, 0x002, 0x177, 0x026, 0x1b2, 0x0e1, 0x179,
    0x0ff, 0x1ff, 0x198, 0x106, 0x104, 0x100, 0x03a, 0x160,
    0x035, 0x100, 0x011, 0x100,    -1, 0x029, 0x100,    -1
};

XV_tpg tpg_inst;
XGpio GPIO_0;


int Status;


int main()
{
    init_platform();

	/* Initialize the GPIO driver */
	Status = XGpio_Initialize(&GPIO_0, XPAR_GPIO_0_DEVICE_ID);
	if (Status != XST_SUCCESS) {
		xil_printf("Gpio0 Initialization Failed\r\n");
		return XST_FAILURE;
	}
	XGpio_SetDataDirection(&GPIO_0, 1, 0x00);
	XGpio_DiscreteSet(&GPIO_0, 1, TFT_CS);
	XGpio_DiscreteClear(&GPIO_0, 1, TFT_SCK);
	XGpio_DiscreteClear(&GPIO_0, 1, TFT_MOSI);
	XGpio_DiscreteSet(&GPIO_0, 1, TFT_BL);
	//delay(100000);
    print("Hello World Video\n\r");

    setup_lcd();

    XGpio_SetDataDirection(&GPIO_0, 1, TFT_SCK);

    /* Insert the code for the TPG here */
    Status = XV_tpg_Initialize(&tpg_inst, XPAR_V_TPG_0_DEVICE_ID);
    if(Status!= XST_SUCCESS)
    {
    	xil_printf("TPG configuration failed\r\n");
        	return(XST_FAILURE);
    }

    // Set Resolution to 800x600
    XV_tpg_Set_height(&tpg_inst, 800);
    XV_tpg_Set_width(&tpg_inst, 480);

    // Set Color Space to RGB
    XV_tpg_Set_colorFormat(&tpg_inst, 0x0);

    //Set pattern to color bar
    XV_tpg_Set_bckgndId(&tpg_inst, XTPG_BKGND_DP_COLOR_RAMP);

    //Start the TPG
    XV_tpg_EnableAutoRestart(&tpg_inst);
    XV_tpg_Start(&tpg_inst);
    xil_printf("TPG started!\r\n");
    u16 id=1;
    while(1)
    {
    	XV_tpg_Set_bckgndId(&tpg_inst, id);
    	id++;
    	if(id>20)
    	{
    		id=1;
    	}
    	for(volatile u32 i=0;i<100000000;i++);
    }

    /* End of TPG code*/
    cleanup_platform();
    return 0;
}

void send_bits(uint16_t data, uint16_t count)
{
    int x;
    int mask = 1 << (count-1);
    for(x = 0; x < count; x++){
        if((data & mask) > 0)
        {
        	XGpio_DiscreteSet(&GPIO_0, 1, TFT_MOSI);
        }
        else
        {
        	XGpio_DiscreteClear(&GPIO_0, 1, TFT_MOSI);
        }
        data <<= 1;

        XGpio_DiscreteClear(&GPIO_0, 1, TFT_SCK);
        delay(50);
        XGpio_DiscreteSet(&GPIO_0, 1, TFT_SCK);
        delay(50);
    }
    XGpio_DiscreteClear(&GPIO_0, 1, TFT_MOSI);
}

void write(uint16_t command)
{
	XGpio_DiscreteClear(&GPIO_0, 1, TFT_CS);
    send_bits(command, 9);
    XGpio_DiscreteSet(&GPIO_0, 1, TFT_CS);
}

void setup_lcd(void)
{
    int count = sizeof(commands) / sizeof(int32_t);
    int x;
    for(x = 0; x < count; x++){
        int32_t command = commands[x];
        if(command == -1){
        	delay(100000);
            continue;
        }
        write((uint16_t)command);
    }
}

void delay(unsigned int time)
{
	//simple delay function
	for (unsigned int Delay = 0; Delay < time; Delay++);
}
