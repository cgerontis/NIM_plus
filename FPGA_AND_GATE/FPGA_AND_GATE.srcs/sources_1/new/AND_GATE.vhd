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
           GCLK  : in STD_LOGIC;
           JC1_P : out STD_LOGIC;
           JC2_P : out STD_LOGIC;
           FMC_LA18_CC_P: out STD_LOGIC );
end AND_GATE;

architecture Behavioral of AND_GATE is

signal count: integer:=1;
signal state: integer:=0;
signal tmp: STD_LOGIC := '0';

begin
    process (GCLK,tmp) begin
        if (GCLK' event and GCLK = '1') then
            count <= count + 1;
        if(count = 20) then
            tmp <= NOT tmp;
            count <= 1;
        end if;
        end if;
        JC2_P <= tmp;
        FMC_LA18_CC_P <= tmp;
    end process;
    
dac_proc: process(tmp)
        begin
            case state is
                when 0 =>
                    if wr_blk_p = '0' then
                        NextState_Sreg0 <= S1;
                        wr_blk_p <= '1';
                        wr_dac_p <= '0';
                    elsif wr_blk_p = '1' then
                        NextState_Sreg0 <= S1;
                        wr_blk_p <= '0';
                    end if;
                when S3 =>
                    NextState_Sreg0 <= S4;
                    next_bit_ptr <= bit_ptr - 1;
                    next_FMC_LA18_CC_P <= '0';
                when S1 =>
        end process;
        
Sreg0_CurrentState: process (tmp)
        begin
            if tmp'event and tmp = '1' then
                state <= state + 1; 
            end if;
        end process;
end Behavioral;
