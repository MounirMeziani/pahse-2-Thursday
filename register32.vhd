LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY register32 IS
PORT(
	inputD			:	IN std_logic_vector(31 downto 0);
	clr				:	IN std_logic;
	clk				:	IN std_logic;
	reg_in			:	IN std_logic;
	outputQ			:	OUT std_logic_vector(31 downto 0)
);
END register32;


ARCHITECTURE arch OF register32 IS
BEGIN
	register32: PROCESS(clk,clr)
	BEGIN
		IF (clr = '1') THEN
				outputQ <= b"0000_0000_0000_0000_0000_0000_0000_0000";
		ELSIF rising_edge(clk) THEN
			IF (reg_in = '1') THEN
				outputQ <= inputD;
			END IF;
		END IF;
	END PROCESS;
END arch;