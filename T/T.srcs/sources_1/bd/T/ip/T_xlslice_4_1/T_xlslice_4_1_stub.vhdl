-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Tue May 17 14:12:00 2022
-- Host        : LAPTOP-GQQ9775L running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top T_xlslice_4_1 -prefix
--               T_xlslice_4_1_ T_xlslice_4_1_stub.vhdl
-- Design      : T_xlslice_4_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_xlslice_4_1 is
  Port ( 
    Din : in STD_LOGIC_VECTOR ( 23 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 5 downto 0 )
  );

end T_xlslice_4_1;

architecture stub of T_xlslice_4_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "Din[23:0],Dout[5:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "xlslice_v1_0_1_xlslice,Vivado 2017.4";
begin
end;
