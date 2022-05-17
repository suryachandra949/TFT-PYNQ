onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L xpm -L axi_lite_ipif_v3_0_4 -L lib_cdc_v1_0_2 -L interrupt_control_v3_1_4 -L axi_gpio_v2_0_17 -L v_tc_v6_1_12 -L proc_sys_reset_v5_0_12 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.T xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {T.udo}

run -all

quit -force
