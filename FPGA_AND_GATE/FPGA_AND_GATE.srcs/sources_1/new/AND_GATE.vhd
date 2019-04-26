----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/02/2018 02:15:22 PM
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



-- button led AND
--entity AND_GATE is
--   Port ( button1 : in STD_LOGIC;
--           button2 : in STD_LOGIC;
--           led1 : out STD_LOGIC);
--end AND_GATE;
--
--architecture Behavioral of AND_GATE is
--
--begin
--    led1 <= button1 AND button2;
--end Behavioral;




-- signal led AND (coincidence)
entity AND_GATE is
   Port (  
           sigout1 : out STD_LOGIC;
           sigout2 : out STD_LOGIC;
           GCLK  : in STD_LOGIC;
           JC1_P : out STD_LOGIC;
           JC1_N : out STD_LOGIC;
           JC2_P : out STD_LOGIC;
           JC2_N : out STD_LOGIC;
           FMC_LA17_CC_P: out STD_LOGIC;
           FMC_LA18_CC_P: out STD_LOGIC;
           FMC_LA18_CC_N: out STD_LOGIC );
end AND_GATE;

architecture Behavioral of AND_GATE is

signal count: integer:=1;
signal state: integer:=0;
signal clk: STD_LOGIC := '0';

begin
    process (GCLK,clk) begin
        if (GCLK' event and GCLK = '1') then
            count <= count + 1;
        if(count = 1000) then
            clk <= NOT clk;
            count <= 1;
        end if;
        end if;
        JC2_P <= clk;
        FMC_LA18_CC_P <= clk;
    end process;
    
dac_proc: process(clk)
        begin
            case state is
                when 0 =>
                    sigout1 <= '0';
                    sigout2 <= '0';
                    FMC_LA17_CC_P <= '0';
                    FMC_LA18_CC_N <= '0';
                when 1 =>
                    sigout1 <= '0';
                    sigout2 <= '1';
                    FMC_LA17_CC_P <= '0';
                    FMC_LA18_CC_N <= '1';
                when 2 =>
                    sigout1 <= '0';
                    sigout2 <= '0';
                    FMC_LA17_CC_P <= '0';
                    FMC_LA18_CC_N <= '0';
                when 3 =>
                   sigout1 <= '0';
                   sigout2 <= '0';
                   FMC_LA17_CC_P <= '0';
                   FMC_LA18_CC_N <= '0';
                when 4 =>
                   sigout1 <= '1';
                   sigout2 <= '0';
                   FMC_LA17_CC_P <= '1';
                   FMC_LA18_CC_N <= '0';
                when 5 =>
                   sigout1 <= '0';
                   sigout2 <= '0';
                   FMC_LA17_CC_P <= '0';
                   FMC_LA18_CC_N <= '0';
                when 6 =>--DATA BIT 15
                   sigout1 <= '1';
                   sigout2 <= '0';
                   FMC_LA17_CC_P <= '1';
                   FMC_LA18_CC_N <= '0';
                when 7 =>
                   sigout1 <= '1';
                   sigout2 <= '0';
                   FMC_LA17_CC_P <= '1';
                   FMC_LA18_CC_N <= '0';
                when 8 =>
                   sigout1 <= '0';
                   sigout2 <= '0';
                   FMC_LA17_CC_P <= '0';
                   FMC_LA18_CC_N <= '0';
                when 9 =>
                   sigout1 <= '0';
                   sigout2 <= '0';
                   FMC_LA17_CC_P <= '0';
                   FMC_LA18_CC_N <= '0';
                when 10 =>
                   sigout1 <= '0';
                   sigout2 <= '0';
                   FMC_LA17_CC_P <= '0';
                   FMC_LA18_CC_N <= '0';
                when 11 =>
                   sigout1 <= '0';
                   sigout2 <= '0';
                   FMC_LA17_CC_P <= '0';
                   FMC_LA18_CC_N <= '0';
                when 12 =>
                   sigout1 <= '0';
                   sigout2 <= '0';
                   FMC_LA17_CC_P <= '0';
                   FMC_LA18_CC_N <= '0';
                when 13 =>
                   sigout1 <= '0';
                   sigout2 <= '0';
                   FMC_LA17_CC_P <= '0';
                   FMC_LA18_CC_N <= '0';
                when 14 =>
                   sigout1 <= '0';
                   sigout2 <= '0';
                   FMC_LA17_CC_P <= '0';
                   FMC_LA18_CC_N <= '0';
                when 15 =>
                   sigout1 <= '0';
                   sigout2 <= '0';
                   FMC_LA17_CC_P <= '0';
                   FMC_LA18_CC_N <= '0';
                when 16 =>
                   sigout1 <= '0';
                   sigout2 <= '0';
                   FMC_LA17_CC_P <= '0';
                   FMC_LA18_CC_N <= '0';
                when 17 =>
                   sigout1 <= '0';
                   sigout2 <= '0';
                   FMC_LA17_CC_P <= '0';
                   FMC_LA18_CC_N <= '0';
                when others =>
                   sigout1 <= '0';
                   sigout2 <= '1';   
                   FMC_LA17_CC_P <= '0';
                   FMC_LA18_CC_N <= '1';
            end case;
            
        end process;
        
    process (clk)
        begin
            if clk' event and clk = '1' then
                if state < 17 then
                    state <= state + 1;
                end if; 
            if state = 17 then
                state <= 0;
            end if;
            end if;
            --FMC_LA17_CC_P <= sigout 1;
            --FMC_LA18_CC_N <= sigout 2;
        end process;
end Behavioral;
