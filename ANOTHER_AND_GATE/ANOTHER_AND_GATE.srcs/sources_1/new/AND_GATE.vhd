----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2019 04:16:47 PM
-- Design Name: 
-- Module Name: AND_GATE - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AND_GATE is
    Port (  FMC_LA06_P : out STD_LOGIC;
            FMC_LA07_P : out STD_LOGIC;
            FMC_LA23_N : out STD_LOGIC;
            FMC_LA23_P : out STD_LOGIC;
            FMC_LA17_CC_P : out STD_LOGIC;
            FMC_LA18_CC_N : out STD_LOGIC;
            FMC_LA18_CC_P : out STD_LOGIC;
            sigout1 : out STD_LOGIC;
            sigout2 : out STD_LOGIC;
            JC1_P : out STD_LOGIC;
            JC2_P : out STD_LOGIC;
            clk : in STD_LOGIC;
            GCLK : in STD_LOGIC;
            FMC_LA12_P : in STD_LOGIC;
            FMC_LA13_P : in STD_LOGIC  );
end AND_GATE;

architecture Behavioral of AND_GATE is

begin

dac_proc: process(clk)
    begin
        FMC_LA18_CC_N <= '1';
        FMC_LA18_CC_P <= '0';
        FMC_LA18_CC_N <= '0' after 90ns; --sync down
        
        FMC_LA17_CC_P <= '0'; --infobit 0
        FMC_LA18_CC_P <= '1' after 15ns; -- clck high
        JC2_P <= '1'; --pmod2 high
        FMC_LA18_CC_P <= '0' after 15ns; -- clock low
        JC2_P <= '0'; --pmod2 low
        JC1_P <= '0';
        
        FMC_LA17_CC_P <= '0'; --infobit 1
        FMC_LA18_CC_P <= '1' after 15ns;
        JC2_P <= '1';
        FMC_LA18_CC_P <= '0' after 15ns;
        JC2_P <= '0';
        JC1_P <= '0';
        
        FMC_LA17_CC_P <= '1'; --infobit 2
        FMC_LA18_CC_P <= '1' after 15ns;
        JC2_P <= '1';
        FMC_LA18_CC_P <= '0' after 15ns;
        JC2_P <= '0';
        JC1_P <= '1';
        
        FMC_LA17_CC_P <= '0'; --infobit 3
        FMC_LA18_CC_P <= '1' after 15ns;
        JC2_P <= '1';
        FMC_LA18_CC_P <= '0' after 15ns;
        JC2_P <= '0';
        JC1_P <= '0';
        
        FMC_LA17_CC_P <= '0'; --databit 11
        FMC_LA18_CC_P <= '1' after 15ns;
        JC2_P <= '1';
        FMC_LA18_CC_P <= '0' after 15ns;
        JC2_P <= '0';
        JC1_P <= '0';
        
        FMC_LA17_CC_P <= '0'; --databit 10
        FMC_LA18_CC_P <= '1' after 15ns;
        JC2_P <= '1';
        FMC_LA18_CC_P <= '0' after 15ns;
        JC2_P <= '0';
        JC1_P <= '0';
        
        FMC_LA17_CC_P <= '1'; --databit 09
        FMC_LA18_CC_P <= '1' after 15ns;
        JC2_P <= '1';
        FMC_LA18_CC_P <= '0' after 15ns;
        JC2_P <= '0';
        JC1_P <= '1';
        
        FMC_LA17_CC_P <= '1'; --databit 08
        FMC_LA18_CC_P <= '1' after 15ns;
        JC2_P <= '1';
        FMC_LA18_CC_P <= '0' after 15ns;
        JC2_P <= '0';
        JC1_P <= '1';
        
        FMC_LA17_CC_P <= '0'; --databit 07
        FMC_LA18_CC_P <= '1' after 15ns;
        JC2_P <= '1';
        FMC_LA18_CC_P <= '0' after 15ns;
        JC2_P <= '0';
        JC1_P <= '0';
        
        FMC_LA17_CC_P <= '0'; --databit 06
        FMC_LA18_CC_P <= '1' after 15ns;
        JC2_P <= '1';
        FMC_LA18_CC_P <= '0' after 15ns;
        JC2_P <= '0';
        JC1_P <= '0';
        
        FMC_LA17_CC_P <= '1'; --databit 05
        FMC_LA18_CC_P <= '1' after 15ns;
        JC2_P <= '1';
        FMC_LA18_CC_P <= '0' after 15ns;
        JC2_P <= '0';
        JC1_P <= '1';
        
        FMC_LA17_CC_P <= '1'; --databit 04
        FMC_LA18_CC_P <= '1' after 15ns;
        JC2_P <= '1';
        FMC_LA18_CC_P <= '0' after 15ns;
        JC2_P <= '0';
        JC1_P <= '1';
        
        FMC_LA17_CC_P <= '0'; --databit 03
        FMC_LA18_CC_P <= '1' after 15ns;
        JC2_P <= '1';
        FMC_LA18_CC_P <= '0' after 15ns;
        JC2_P <= '0';
        JC1_P <= '0';
        
        FMC_LA17_CC_P <= '0'; --databit 02
        FMC_LA18_CC_P <= '1' after 15ns;
        JC2_P <= '1';
        FMC_LA18_CC_P <= '0' after 15ns;
        JC2_P <= '0';
        JC1_P <= '0';
        
        FMC_LA17_CC_P <= '1'; --databit 01
        FMC_LA18_CC_P <= '1' after 15ns;
        JC2_P <= '1';
        FMC_LA18_CC_P <= '0' after 15ns;
        JC2_P <= '0';
        JC1_P <= '1';
        
        FMC_LA17_CC_P <= '1'; --databit 00
        FMC_LA18_CC_P <= '1' after 15ns;
        JC2_P <= '1';
        FMC_LA18_CC_P <= '0' after 15ns;
        JC2_P <= '0';
        JC1_P <= '1';
        
        FMC_LA18_CC_N <= '1';
        JC1_P <= '1';
    end process;


end Behavioral;
