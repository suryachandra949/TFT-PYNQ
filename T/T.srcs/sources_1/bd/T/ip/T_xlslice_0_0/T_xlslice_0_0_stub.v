// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Thu May 12 16:59:51 2022
// Host        : LAPTOP-4GTOHG40 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top T_xlslice_0_0 -prefix
//               T_xlslice_0_0_ T_xlslice_0_0_stub.v
// Design      : T_xlslice_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "xlslice_v1_0_1_xlslice,Vivado 2017.4" *)
module T_xlslice_0_0(Din, Dout)
/* synthesis syn_black_box black_box_pad_pin="Din[3:0],Dout[0:0]" */;
  input [3:0]Din;
  output [0:0]Dout;
endmodule
