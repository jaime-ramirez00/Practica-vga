library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
entity vga_tb is
constant h_p: integer := 90;
constant h_bp: integer := 45;
constant h_disp: integer := 600;
constant h_fp: integer := 16;
constant h_pol: std_logic := '0';
constant v_p: integer := 4;
constant v_bp: integer := 35;
constant v_disp: integer := 600;
constant v_fp: integer := 8;
constant v_pol: std_logic := '0'; constant temp: time := 5 ns;  
end entity;
architecture behavior of vga_tb is
component vga is
generic(
h_p,h_bp,h_disp,h_fp,v_p,v_bp,v_disp,v_fp: integer; h_pol,v_pol: std_logic
);
port(
clk: in std_logic; rin: in std_logic_vector(2 downto 0); h_s,v_s: out std_logic; rout: out std_logic_vector(2 downto 0)
);
end component;
signal clk: std_logic  := '0';
signal rin, rout: std_logic_vector(2 downto 0);
signal h_s,v_s      : std_logic;
begin
uut : vga 
generic map(h_p, h_bp, h_disp, h_fp, v_p, v_bp, v_disp, v_fp, h_pol, v_pol)
port map(clk, rin, h_s, v_s, rout); 
process
begin
clk <= '0'; wait for temp / 2;
clk <= '1'; wait for temp / 2;
end process;    
rin <= "111";    
end behavior;