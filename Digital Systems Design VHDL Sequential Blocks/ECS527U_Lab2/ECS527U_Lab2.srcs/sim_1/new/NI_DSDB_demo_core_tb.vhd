library IEEE;
use IEEE.std_logic_1164.all;

entity NI_DSDB_demo_core_tb is
end NI_DSDB_demo_core_tb;

architecture sim of NI_DSDB_demo_core_tb is
    component NI_DSDB_demo_core is
        port (
            sw: in std_logic_vector(7 downto 0);
            led: out std_logic_vector(7 downto 0);
            btn: in std_logic_vector(3 downto 0);
            CLK: in std_logic;
            ss3: out std_logic_vector(3 downto 0);
            ss2: out std_logic_vector(3 downto 0);
            ss1: out std_logic_vector(3 downto 0);
            ss0: out std_logic_vector(3 downto 0)
        );
    end component;
    signal sw, led: std_logic_vector(7 downto 0);
    signal CLK: std_logic;
    signal btn, ss3, ss2, ss1, ss0: std_logic_vector(3 downto 0);
begin
    UUT: NI_DSDB_demo_core port map (sw=>sw, led=>led, CLK=>CLK, btn=>btn, ss3=>ss3, ss2=>ss2, ss1=>ss1, ss0=>ss0);
    clk_proc: process
    begin
        CLK <= '0';
        wait for 50 ns;
        CLK <= '1';
        wait for 50 ns;
    end process;
    sim_proc: process
    begin
        sw <= "00000100";
        btn <= "0001";
        wait for 100 ns;
        btn <= "0000";
        wait for 1000 ns;
        sw <= "00001110";
        btn <= "0001";
        wait for 100 ns;
        btn <= "0000";
        wait;
    end process sim_proc;
end sim;