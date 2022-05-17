-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Tue May 17 14:11:59 2022
-- Host        : LAPTOP-GQQ9775L running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top T_xlslice_4_0 -prefix
--               T_xlslice_4_0_ T_xlslice_4_0_sim_netlist.vhdl
-- Design      : T_xlslice_4_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity T_xlslice_4_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 23 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 5 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of T_xlslice_4_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of T_xlslice_4_0 : entity is "T_xlslice_4_0,xlslice_v1_0_1_xlslice,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of T_xlslice_4_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of T_xlslice_4_0 : entity is "xlslice_v1_0_1_xlslice,Vivado 2017.4";
end T_xlslice_4_0;

architecture STRUCTURE of T_xlslice_4_0 is
  signal \^din\ : STD_LOGIC_VECTOR ( 23 downto 0 );
begin
  Dout(5 downto 0) <= \^din\(23 downto 18);
  \^din\(23 downto 18) <= Din(23 downto 18);
end STRUCTURE;
