library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
	Port (A: in STD_LOGIC;
			B: in STD_LOGIC;
			Ci: in STD_LOGIC;
			S: out STD_LOGIC;
			Co: out STD_LOGIC);
end FullAdder;

architecture Behavioral of FullAdder is 	
begin
	S <= (A xor B) xor Ci;
	Co <= (A and B) or ((A xor B) and Ci);
end Behavioral;
