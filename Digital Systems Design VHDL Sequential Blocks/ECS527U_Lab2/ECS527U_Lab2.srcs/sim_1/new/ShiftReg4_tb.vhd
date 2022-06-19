library IEEE;
use IEEE.std_logic_1164.all;

entity ShiftReg4_tb is
end ShiftReg4_tb;

architecture sim of ShiftReg4_tb is
    component ShiftReg4 is
    port (
        CLK: in std_logic;
        RST: in std_logic;
        Din: in std_logic_vector(3 downto 0);
        Sin: in std_logic;
        LD: in std_logic;
        L_Rn: in std_logic;
        En: in std_logic;
        Q: out std_logic_vector(3 downto 0));
    end component;
    signal Q, Din: std_logic_vector(3 downto 0);
    signal CLK, RST, Sin, LD, L_Rn, En: std_logic;
begin
    UUT: ShiftReg4 port map (CLK=>CLK, RST=>RST, Din=>Din, Sin=>Sin, LD=>LD, L_Rn=>L_Rn, En=>En, Q=>Q);
    clk_proc: process
    begin
        CLK <= '0';
        wait for 50 ns;
        CLK <= '1';
        wait for 50 ns;
    end process;
    sim_proc: process
    begin
        RST <= '1';
        L_Rn <= '1';
        En <= '1';
        Sin <= '1';
        LD <= '0';
        Din <= "1111";
        wait for 100 ns;
        RST <= '0';
        wait for 200 ns;
        En <= '0';
        wait for 300 ns;
        En <= '1';
        wait for 300 ns;
        Sin <= '0';
        L_Rn <= '0';
        wait for 500 ns;
        LD <= '1';
        wait for 100 ns;
        LD <= '0';
        L_Rn <= '1';
        Sin <= '0';
        wait for 500 ns;
        wait;
    end process sim_proc;
end sim;
