library IEEE;
use IEEE.std_logic_1164.all;

entity SyncCount4 is
port (
    CLK: in std_logic;
    CLRn: in std_logic;
    U_Dn: in std_logic;
    En: in std_logic;
    Q: out std_logic_vector(3 downto 0));
end SyncCount4;

