----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2019 05:47:14 PM
-- Design Name: 
-- Module Name: AND_GATE_SYNCH - Behavioral
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

entity AND_GATE_SYNCH is
    Port (  sig1 : in STD_LOGIC;
           sig2 : in STD_LOGIC;
           button1 : in STD_LOGIC;
           button2 : in STD_LOGIC;
           sigout1 : out STD_LOGIC;
           sigout2 : out STD_LOGIC;
           led1 : out STD_LOGIC;
           led2 : out STD_LOGIC;
           led3 : out STD_LOGIC;
           led4 : out STD_LOGIC;
           led5 : out STD_LOGIC;
           led6 : out STD_LOGIC  );
end AND_GATE_SYNCH;

architecture Behavioral of AND_GATE_SYNCH is

begin
    process (clk) begin
        if (clk' event and clk = '1') then
            led1 <= sig1;
            led2 <= sig2;
            led3 <= sig1 AND sig2;
            led4 <= sig1 OR sig2;
            sigout1 <= sig1 AND sig2;
            sigout2 <= sig1 OR sig2;
            led5 <= button1 AND button2;
            led6 <= button1 OR button2;
         end if
    end process
end Behavioral;
