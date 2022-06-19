library IEEE;
use IEEE.std_logic_1164.all;

entity SyncCount4_tb is
end SyncCount4_tb;

architecture sim of SyncCount4_tb is
    component SyncCount4 is
    port (
        CLK: in std_logic;
        CLRn: in std_logic;
        U_Dn: in std_logic;
        En: in std_logic;
        Q: out std_logic_vector(3 downto 0));
    end component;
    signal Q: std_logic_vector(3 downto 0);
    signal CLK, CLRn, U_Dn, En: std_logic;
begin
    UUT: SyncCount4 port map (CLK=>CLK, CLRn=>CLRn, U_Dn=>U_Dn, En=>En, Q=>Q);
    clk_proc: process
    begin
        CLK <= '0';
        wait for 50 ns;
        CLK <= '1';
        wait for 50 ns;
    end process;
    sim_proc: process
    begin
        CLRn <= '0';
        U_Dn <= '1';
        En <= '1';
        wait for 100 ns;
        CLRn <= '1';
        wait for 500 ns;
        En <= '0';
        wait for 200 ns;
        En <= '1';
        wait for 500 ns;
        U_Dn <= '0';
        wait for 800 ns;
        En <= '0';
        wait;
    end process sim_proc;
end sim;