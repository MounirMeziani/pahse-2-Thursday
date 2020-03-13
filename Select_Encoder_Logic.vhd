LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Select_Encoder_Logic IS
PORT	(
			ir_in 						: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			GRAin							: IN STD_LOGIC;
			GRBin							: IN STD_LOGIC;
			GRCin 						: IN STD_LOGIC;
			Rin, Rout, BAout 			: IN STD_LOGIC;
			
			
			C_sign						: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			Rin_output 					: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			Rout_output 				: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);

END ENTITY;

ARCHITECTURE arch OF Select_Encoder_Logic IS 

	signal TEMP : std_logic_vector(3 downto 0);
	
	begin
	c_sign_process  : process(ir_in)
		begin
		for i in 31 downto 18 loop
			C_sign(i) <= ir_in(18);
		
		end loop;	
			C_sign(17 downto 0) <= ir_in(17 downto 0);
		
	end process;
	
	init : process(ir_in, GRAin, GRBin, GRCin)
	begin
		if (GRCin ='1') then
			TEMP <= ir_in(18 downto 15);
		elsif (GRBin = '1') then 
			TEMP <= ir_in(22 downto 19);
		elsif GRAin = '1' then
			TEMP <= ir_in(26 downto 23);
		else 
		end if;
		
	end process init;
	
	
	final : process(TEMP, Rout, Rin, BAout)
		begin
		if Rin = '0' then
				Rin_output <= "0000000000000000";
		else
			case TEMP is
				when "0000" => Rin_output <= "0000000000000001";
				when "0001" => Rin_output <= "0000000000000010";
				when "0010" => Rin_output <= "0000000000000100";
				when "0011" => Rin_output <= "0000000000001000";
				when "0100" => Rin_output <= "0000000000010000";
				when "0101" => Rin_output <= "0000000000100000";
				when "0110" => Rin_output <= "0000000001000000";
				when "0111" => Rin_output <= "0000000010000000";
				when "1000" => Rin_output <= "0000000100000000";
				when "1001" => Rin_output <= "0000001000000000";
				when "1010" => Rin_output <= "0000010000000000";
				when "1011" => Rin_output <= "0000100000000000";
				when "1100" => Rin_output <= "0001000000000000";
				when "1101" => Rin_output <= "0010000000000000";
				when "1110" => Rin_output <= "0100000000000000";
				when "1111" => Rin_output <= "1000000000000000";
				when others => Rin_output <= "0000000000000000";	
			end case;
		end if;
				
				
		if BAout = '1' then
			if TEMP = "0000" then
				Rout_output <= "0000000000000001";
			end if;
		end if;
		
		if Rout = '1' then 
			case TEMP is
				when "0000" =>	Rout_output <= "0000000000000001";
				when "0001" => Rout_output <= "0000000000000010";
				when "0010" => Rout_output <= "0000000000000100";
				when "0011" => Rout_output <= "0000000000001000";
				when "0100" => Rout_output <= "0000000000010000";
				when "0101" => Rout_output <= "0000000000100000";
				when "0110" => Rout_output <= "0000000001000000";
				when "0111" => Rout_output <= "0000000010000000";
				when "1000" => Rout_output <= "0000000100000000";
				when "1001" => Rout_output <= "0000001000000000";
				when "1010" => Rout_output <= "0000010000000000";
				when "1011" => Rout_output <= "0000100000000000";
				when "1100" => Rout_output <= "0001000000000000";
				when "1101" => Rout_output <= "0010000000000000";
				when "1110" => Rout_output <= "0100000000000000";
				when "1111" => Rout_output <= "1000000000000000";
				when others => Rout_output <= "0000000000000000";
			end case;
		else
			if BAout = '0' then
				Rout_output <= "0000000000000000";
			end if;
		end if;	
	end process final;
				
END;