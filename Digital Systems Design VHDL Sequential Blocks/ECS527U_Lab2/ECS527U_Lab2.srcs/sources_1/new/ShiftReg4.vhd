library IEEE;
use IEEE.std_logic_1164.all;

entity ShiftReg4 is
port (
    CLK: in std_logic;
    RST: in std_logic;
    Din: in std_logic_vector(3 downto 0);
    Sin: in std_logic;
    LD: in std_logic;
    L_Rn: in std_logic;
    En: in std_logic;
    Q: out std_logic_vector(3 downto 0));
end ShiftReg4;

