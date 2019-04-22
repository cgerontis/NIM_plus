-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\compile\DAC_Control.vhd
-- Generated   : 04/04/16 15:07:21
-- From        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\DAC_Control.asf
-- By          : FSM2VHDL ver. 5.0.7.2
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity DAC_Control is 
	port (
		GCLK: in STD_LOGIC;
		FMC_LA17_CC_P : out STD_LOGIC;
		FMC_LA18_CC_P: out STD_LOGIC;
		FMC_LA18_CC_N: out STD_LOGIC;
		JC1_P: out STD_LOGIC);
end DAC_Control;

architecture DAC_Control_arch of DAC_Control is

constant z16: STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
-- diagram signals declarations
signal bit_ptr: INTEGER range 15 downto 0;
signal data_reg: STD_LOGIC_VECTOR (15 downto 0);
signal reset_p: STD_LOGIC := '0';
signal count: integer:=1;
signal clock: STD_LOGIC := '0';
signal wr_blk_p: STD_LOGIC := '0';
signal wr_dac_p: STD_LOGIC := '1';
signal wr_error: STD_LOGIC;
signal blk_data_in: STD_LOGIC_VECTOR (15 downto 0) := "0010100000000000";

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S2, S3, S1, S4, S7, S8, S5, S6 
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_FMC_LA17_CC_P, next_FMC_LA17_CC_P: STD_LOGIC;
signal int_FMC_LA18_CC_P, next_FMC_LA18_CC_P: STD_LOGIC;
signal int_FMC_LA18_CC_N, next_FMC_LA18_CC_N: STD_LOGIC;
signal int_wr_error, next_wr_error: STD_LOGIC;
signal next_bit_ptr: INTEGER range 15 downto 0;
signal next_data_reg: STD_LOGIC_VECTOR (15 downto 0);

begin

process (GCLK,clock) begin
        if (GCLK' event and GCLK = '1') then
            count <= count + 1;
        if(count = 10) then
            clock <= NOT clock;
            count <= 1;
        end if;
        end if;
    end process;



----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (bit_ptr, blk_data_in, data_reg, int_FMC_LA17_CC_P, int_FMC_LA18_CC_P, int_FMC_LA18_CC_N, int_wr_error, wr_blk_p, wr_dac_p, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_FMC_LA18_CC_P <= int_FMC_LA18_CC_P;
	next_FMC_LA18_CC_N <= int_FMC_LA18_CC_N;
	next_FMC_LA17_CC_P <= int_FMC_LA17_CC_P;
	next_bit_ptr <= bit_ptr;
	next_wr_error <= int_wr_error;
	next_data_reg <= data_reg;
	case Sreg0 is
		when S2 =>
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
			if wr_blk_p = '1' and 
				wr_dac_p = '0' then
				NextState_Sreg0 <= S2;
				next_data_reg <= blk_data_in;
				next_FMC_LA18_CC_P <= '0';
				next_FMC_LA18_CC_N <= '1';
				wr_blk_p <= '1';
				wr_dac_p <= '1';
			elsif wr_blk_p = '0' and 
				wr_dac_p = '1' then
				NextState_Sreg0 <= S3;
				next_FMC_LA18_CC_P <= '1';
				next_FMC_LA18_CC_N <= '0';
				next_FMC_LA17_CC_P <= data_reg(bit_ptr);
			elsif wr_blk_p = '1' and 
				wr_dac_p = '1' then
				NextState_Sreg0 <= S5;
				next_wr_error <= '1';
			elsif wr_dac_p = '0' and 
				wr_blk_p = '0' then
				NextState_Sreg0 <= S1;
				next_FMC_LA18_CC_P <= '0';
				next_FMC_LA18_CC_N <= '1';
				next_FMC_LA17_CC_P <= '0';
			end if;
		when S4 =>
			if bit_ptr >  0 then
				NextState_Sreg0 <= S3;
				next_FMC_LA18_CC_P <= '1';
				next_FMC_LA18_CC_N <= '0';
				next_FMC_LA17_CC_P <= data_reg(bit_ptr);
			elsif bit_ptr = 0 then
				NextState_Sreg0 <= S6;
				next_FMC_LA18_CC_P <= '1';
				next_FMC_LA18_CC_N <= '0';
				next_FMC_LA17_CC_P <= data_reg(bit_ptr);
			end if;
		when S7 =>
			NextState_Sreg0 <= S8;
			next_FMC_LA18_CC_P <= '0';
			next_FMC_LA18_CC_N <= '1';
			wr_dac_p <= '0';
		when S8 =>
			if wr_dac_p = '0' then
				NextState_Sreg0 <= S1;
				next_wr_error <= '0';
				next_bit_ptr <= 15;
				wr_blk_p <= '1';
			elsif wr_dac_p = '1' then
				NextState_Sreg0 <= S8;
				wr_dac_p <= '0';
			end if;
		when S5 =>
			if wr_blk_p = '0' and wr_dac_p = '0' then
				NextState_Sreg0 <= S1;
				next_wr_error <= '0';
			else
				NextState_Sreg0 <= S5;
			end if;
		when S6 =>
			NextState_Sreg0 <= S7;
			next_FMC_LA18_CC_P <= '0';
--vhdl_cover_off
		when others =>
			null;
--vhdl_cover_on
	end case;
end process;

------------------------------------
-- Current State Logic (sequential)
------------------------------------
Sreg0_CurrentState: process (clock)
begin
	if clock'event and clock = '1' then
		if reset_p = '1' then
			Sreg0 <= S1;
		else
			Sreg0 <= NextState_Sreg0;
		end if;
	end if;
end process;

------------------------------------
-- Registered Outputs Logic
------------------------------------
Sreg0_RegOutput: process (clock)
begin
	if clock'event and clock = '1' then
		if reset_p = '1' then
			bit_ptr <= 15;
			data_reg <= z16;
			int_FMC_LA18_CC_P <= '0';
			int_FMC_LA18_CC_N <= '1';
			int_FMC_LA17_CC_P <= '0';
			int_wr_error <= '0';
		else
			bit_ptr <= next_bit_ptr;
			data_reg <= next_data_reg;
			int_FMC_LA18_CC_P <= next_FMC_LA18_CC_P;
			int_FMC_LA18_CC_N <= next_FMC_LA18_CC_N;
			int_FMC_LA17_CC_P <= next_FMC_LA17_CC_P;
			int_wr_error <= next_wr_error;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
FMC_LA18_CC_P <= int_FMC_LA18_CC_P;
FMC_LA18_CC_N <= int_FMC_LA18_CC_N;
FMC_LA17_CC_P <= int_FMC_LA17_CC_P;
wr_error <= int_wr_error;
JC1_P <= clock;

end DAC_Control_arch;
