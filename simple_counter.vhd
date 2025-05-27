-- Simple 4-bit Counter in VHDL
-- File: simple_counter.vhd
-- Test Quartus Prime Synthesis & Simulation

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity simple_counter is
    port (
        clk     : in  std_logic;   -- Clock input
        reset   : in  std_logic;   -- Active-high reset
        count   : out std_logic_vector(3 downto 0)  -- 4-bit counter output
    );
end entity simple_counter;

architecture behavior of simple_counter is
    signal counter_reg : unsigned(3 downto 0) := (others => '0');
begin
    process(clk, reset)
    begin
        if reset = '1' then
            counter_reg <= (others => '0');  -- Reset counter to 0
        elsif rising_edge(clk) then
            counter_reg <= counter_reg + 1;  -- Increment counter on clock edge
        end if;
    end process;

    count <= std_logic_vector(counter_reg);  -- Output counter value
end architecture behavior;