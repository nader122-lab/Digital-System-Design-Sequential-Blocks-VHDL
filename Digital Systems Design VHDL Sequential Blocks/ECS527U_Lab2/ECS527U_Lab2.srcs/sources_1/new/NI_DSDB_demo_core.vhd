----------------------------------------------------------------------------------
-- Company: Queen Mary University of London
-- Engineer: Matthew Tang
-- 
-- Modified Date: 10.02.2020
-- Design Name: 
-- Module Name: NI_DSDB_demo_core - Behavioral
-- Project Name: ECS527U Lab 2 - Sequential Blocks
-- Target Devices: NI DSDB Board
-- Tool Versions: Vivado 2017.03
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity NI_DSDB_demo_core is
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
end NI_DSDB_demo_core;

architecture Behavioral of NI_DSDB_demo_core is
    component SyncCount4 is
    port (
        CLK: in std_logic;
        CLRn: in std_logic;
        U_Dn: in std_logic;
        En: in std_logic;
        Q: out std_logic_vector(3 downto 0));
    end component;
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
    signal QC, N, QS: std_logic_vector(3 downto 0);
    signal Resetn, Reset, EnC, EnS, Sin: std_logic;
begin   
    -- LFSR from a shift register and a counter
    U_Counter: SyncCount4 port map (CLK => CLK, CLRn => Resetn, U_Dn => '1', En => EnC, Q => QC);
    EnC <= '1' when QC /= N else '0'; -- count up to N

    U_ShiftReg: ShiftReg4 port map (CLK => CLK, RST => '0', Sin => Sin, Din => "1111", LD => Reset, L_Rn => '1', En => EnS, Q => QS);
    Sin <= QS(3) xor QS(2);
    EnS <= EnC; -- same
    
    -- connect the inputs
    N <= sw(3 downto 0);
    Reset <= btn(0);
    Resetn <= not Reset; -- for Active-low
    
    -- connect the outpus
    led(0) <= not EnC; -- done signal
    led(7 downto 1) <= (others => '0'); -- not used
    ss3 <= (others => '0'); -- not used
    ss2 <= (others => '0'); -- not used
    ss1 <= (others => '0'); -- not used
    ss0 <= QS; -- output from LFSR
end Behavioral;
