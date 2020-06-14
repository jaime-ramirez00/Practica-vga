--Jaime Andres Ramirez Stanford
--A00825248
--Laboratorio de sistemas digitales
--Programa main de practica vga
library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
entity vga is
generic(
h_p,h_bp,h_disp,h_fp,v_p,v_bp,v_disp,v_fp: integer;
h_pol, v_pol: std_logic
);
port(
clk: in std_logic;
rin: in std_logic_vector(2 downto 0);
h_s,v_s: out std_logic;
rout: out std_logic_vector(2 downto 0)
);
end entity;
architecture behavior of vga is
component vga_pix is
port(
clk,v_o: in std_logic; pix_x, pix_y: in integer; rin: in std_logic_vector(2 downto 0); rout: out std_logic_vector(2 downto 0)
);
end component;
component vga_s is
generic(
h_p, h_bp, h_disp, h_fp, v_p,v_bp, v_disp, v_fp: integer;
h_pol,v_pol : std_logic
);
port(
clk: in std_logic;
en,h_s,v_s,clk_v,v_o: out std_logic;
col,reng: out integer
);
end component;
signal en,clk_v,v_o: std_logic  := '0';
signal col,reng: integer    :=  0 ;
begin
uut0 : vga_s 
generic map(h_p, h_bp, h_disp, h_fp, v_p, v_bp, v_disp, v_fp, h_pol, v_pol)
port map(clk, en, h_s, v_s, clk_v, v_o, col, reng);
uut1: vga_pix 
port map(clk, v_o,col, reng, rin,rout);
end behavior;