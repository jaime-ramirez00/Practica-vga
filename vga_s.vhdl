--Laboratorio de sistemas digitales
--Jaime Ramirez Stanford
--A00825248
--Programa para sincronizacion hoirzontal y vertical del vga
library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
entity vga_s is
generic(
h_p, h_bp, h_disp, h_fp, v_p, v_bp, v_disp, v_fp: integer;
h_pol,v_pol : std_logic
);
port(
clk: in std_logic;
en,h_s,v_s,clk_v,v_o: out std_logic;
col,reng: out integer
);
end entity;
architecture behavior of vga_s is
constant h_clk : integer := h_p + h_bp + h_disp + h_fp;
constant v_clk : integer := v_p + v_bp + v_disp + v_fp;
signal h_cnt, v_cnt : integer range 0 to h_clk -1 := 0;
signal on_h, on_v : std_logic;
begin
clk_v <= clk;
v_o <= on_h and on_v;
process 
begin 
wait until clk'event and clk = '1';        
if h_cnt < (h_clk-1) then
h_cnt <= (h_cnt + 1);
else 
h_cnt <= 0;
if v_cnt < (v_clk-1) then
v_cnt <= v_cnt + 1;
else 
v_cnt <= 0;
end if;
end if;
if h_cnt < h_disp + h_fp or h_cnt >= h_disp + h_fp + h_p then
h_s <= (not h_pol);
else
h_s <= h_pol;
end if;
if v_cnt < v_disp + v_fp or v_cnt >= v_disp + v_fp + v_p then
v_s <= (not v_pol);
else
v_s <= v_pol;
end if;
if h_cnt < h_disp then 
col <= h_cnt;
end if;        
if v_cnt < v_disp then 
reng <= v_cnt;
end if;     
if h_cnt < h_disp and v_cnt < v_disp then 
en <= '1';
else 
en <= '0';
end if;
if h_cnt <= h_disp - 1 then
on_h <= '1';
else
on_h <= '0';
end if;
if v_cnt <= v_disp - 1 then
on_v <= '1';
else
on_v <= '0';
end if;
end process;
end behavior;