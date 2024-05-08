library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR(7 downto 0);
           B : in  STD_LOGIC_VECTOR(7 downto 0);
           OP : in  STD_LOGIC_VECTOR(1 downto 0);
           OUTPUT : out  STD_LOGIC_VECTOR(7 downto 0);
			  OVERFLOW: out STD_LOGIC);
end ALU;


architecture ALU_Behavioral of ALU is
	component FullAdder8 is
   Port ( A: in STD_LOGIC_VECTOR (7 downto 0);
           B: in STD_LOGIC_VECTOR (7 downto 0);
           Ci: in STD_LOGIC;
           S: out STD_LOGIC_VECTOR (7 downto 0);
           Co: out STD_LOGIC);
	end component;
	signal AdderOut: STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	signal Carry: STD_LOGIC;
	signal SEL: STD_LOGIC := '0';
	signal MuxB: STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin
	MuxB <= B when (SEL = '0') else not B;
	Adder: FullAdder8 port map(
				A => A,
				B => MuxB,
				Ci => SEL,
				S => AdderOut,
				Co => Carry
			);
	ALU_EX: process (A, B, OP, Carry, AdderOut)
	begin
		case (OP) is
			when "00" => OUTPUT <= A nor B; OVERFLOW <= '0';
			when "01" => SEL <= '0'; OUTPUT <= AdderOut; OVERFLOW <= Carry;
			when "10" => SEL <= '1'; OUTPUT <= AdderOut; OVERFLOW <= not Carry;
			when others => OUTPUT <= B; OVERFLOW <= '1';
		end case;
	end process;
end ALU_Behavioral;

