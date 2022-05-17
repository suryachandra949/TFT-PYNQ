vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/interrupt_control_v3_1_4
vlib modelsim_lib/msim/axi_gpio_v2_0_17
vlib modelsim_lib/msim/v_tc_v6_1_12
vlib modelsim_lib/msim/proc_sys_reset_v5_0_12

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap interrupt_control_v3_1_4 modelsim_lib/msim/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_17 modelsim_lib/msim/axi_gpio_v2_0_17
vmap v_tc_v6_1_12 modelsim_lib/msim/v_tc_v6_1_12
vmap proc_sys_reset_v5_0_12 modelsim_lib/msim/proc_sys_reset_v5_0_12

vlog -work xil_defaultlib -64 -incr -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_1 -L axi_vip_v1_1_1 -L processing_system7_vip_v1_0_3 -L xilinx_vip "+incdir+../../../../T.srcs/sources_1/bd/T/ipshared/ec67/hdl" "+incdir+../../../../T.srcs/sources_1/bd/T/ipshared/02c8/hdl/verilog" "+incdir+../../../../T.srcs/sources_1/bd/T/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../T.srcs/sources_1/bd/T/ipshared/ec67/hdl" "+incdir+../../../../T.srcs/sources_1/bd/T/ipshared/02c8/hdl/verilog" "+incdir+../../../../T.srcs/sources_1/bd/T/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../T.srcs/sources_1/bd/T/ip/T_processing_system7_0_0/T_processing_system7_0_0_sim_netlist.vhdl" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../T.srcs/sources_1/bd/T/ipshared/cced/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../T.srcs/sources_1/bd/T/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -64 -93 \
"../../../../T.srcs/sources_1/bd/T/ipshared/8e66/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_17 -64 -93 \
"../../../../T.srcs/sources_1/bd/T/ipshared/c450/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../T.srcs/sources_1/bd/T/ip/T_axi_gpio_0_0/sim/T_axi_gpio_0_0.vhd" \

vcom -work v_tc_v6_1_12 -64 -93 \
"../../../../T.srcs/sources_1/bd/T/ipshared/6694/hdl/v_tc_v6_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../T.srcs/sources_1/bd/T/ip/T_v_tc_0_0/sim/T_v_tc_0_0.vhd" \
"../../../../T.srcs/sources_1/bd/T/ip/T_v_axi4s_vid_out_0_0/T_v_axi4s_vid_out_0_0_sim_netlist.vhdl" \

vcom -work proc_sys_reset_v5_0_12 -64 -93 \
"../../../../T.srcs/sources_1/bd/T/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../T.srcs/sources_1/bd/T/ip/T_rst_ps7_0_100M_0/sim/T_rst_ps7_0_100M_0.vhd" \
"../../../../T.srcs/sources_1/bd/T/ip/T_util_vector_logic_0_0/T_util_vector_logic_0_0_sim_netlist.vhdl" \
"../../../../T.srcs/sources_1/bd/T/ip/T_xlslice_0_0/T_xlslice_0_0_sim_netlist.vhdl" \
"../../../../T.srcs/sources_1/bd/T/ip/T_xlslice_0_1/T_xlslice_0_1_sim_netlist.vhdl" \
"../../../../T.srcs/sources_1/bd/T/ip/T_xlslice_0_2/T_xlslice_0_2_sim_netlist.vhdl" \
"../../../../T.srcs/sources_1/bd/T/ip/T_xlslice_0_3/T_xlslice_0_3_sim_netlist.vhdl" \
"../../../../T.srcs/sources_1/bd/T/ip/T_xlslice_4_0/T_xlslice_4_0_sim_netlist.vhdl" \
"../../../../T.srcs/sources_1/bd/T/ip/T_xlslice_4_1/T_xlslice_4_1_sim_netlist.vhdl" \
"../../../../T.srcs/sources_1/bd/T/ip/T_xlslice_4_2/T_xlslice_4_2_sim_netlist.vhdl" \
"../../../../T.srcs/sources_1/bd/T/ip/T_xbar_0/T_xbar_0_sim_netlist.vhdl" \
"../../../../T.srcs/sources_1/bd/T/ip/T_v_tpg_0_0/T_v_tpg_0_0_sim_netlist.vhdl" \
"../../../../T.srcs/sources_1/bd/T/ip/T_auto_pc_0/T_auto_pc_0_sim_netlist.vhdl" \
"../../../../T.srcs/sources_1/bd/T/sim/T.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

