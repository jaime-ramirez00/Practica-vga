--Laboratorio de sistemas digitales
--Jaime Andres Ramirez Stanford
--A00825248
--Programa para generacion de pixeles para vga
library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
entity vga_pix is
port(
clk,v_o: in std_logic; pix_x, pix_y: in integer; rin: in std_logic_vector(2 downto 0); rout: out std_logic_vector(2 downto 0)
);
end entity;
architecture behavior of vga_pix is
begin
process 
begin 
wait until clk'event and clk = '1';        
rout <= rin and v_o & v_o & v_o;        
end process;
end behavior;