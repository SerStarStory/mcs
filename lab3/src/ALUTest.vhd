LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ALUTest IS
END ALUTest;
 
ARCHITECTURE behavior OF ALUTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         OP : IN  std_logic_vector(1 downto 0);
         OUTPUT : OUT  std_logic_vector(7 downto 0);
         OVERFLOW : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal OP : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal OUTPUT : std_logic_vector(7 downto 0);
   signal OVERFLOW : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          OP => OP,
          OUTPUT => OUTPUT,
          OVERFLOW => OVERFLOW
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 1ps;
		A <= "00001111";
		B <= "01110000";
		OP <= "00";
		
		wait for 2ps;
		
		assert OUTPUT = "10000000" report "#1a" severity FAILURE;
		assert OVERFLOW = '0' report "#1b" severity FAILURE;
		
		OP <= "01";
		
		wait for 2ps;
		
		assert OUTPUT = "01111111" report "#2a" severity FAILURE;
		assert OVERFLOW = '0' report "#2b" severity FAILURE;
		
		A <= "10001111";
		B <= "11110000";
		
		wait for 2ps;
		
		assert OUTPUT = "01111111" report "#3a" severity FAILURE;
		assert OVERFLOW = '1' report "#3b" severity FAILURE;
		
		A <= "11111111";
		B <= "00000001";
		
		wait for 2ps;
		
		assert OUTPUT = "00000000" report "#4a" severity FAILURE;
		assert OVERFLOW = '1' report "#4b" severity FAILURE;
		
		OP <= "10";
		
		wait for 2ps;
		
		assert OUTPUT = "11111110" report "#5a" severity FAILURE;
		assert OVERFLOW = '0' report "#5b" severity FAILURE;
		
		OP <= "11";
		
		wait for 2ps;
		
		assert OUTPUT = "00000000" report "#6a" severity FAILURE;
		assert OVERFLOW = '1' report "#6b" severity FAILURE;
		
		OP <= "10";
		A <= "01111111";
		B <= "01111111";
		
		wait for 2ps;
		
		

      wait;
   end process;

END;
