LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ACCTest IS
END ACCTest;
 
ARCHITECTURE behavior OF ACCTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ACC
    PORT(
         WR : IN  std_logic;
         RESET : IN  std_logic;
         CLK : IN  std_logic;
         INPUT : IN  std_logic_vector(7 downto 0);
         OUTPUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal WR : std_logic := '0';
   signal RESET : std_logic := '0';
   signal CLK : std_logic := '0';
   signal INPUT : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal OUTPUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLKP: time := 2 ps;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ACC PORT MAP (
          WR => WR,
          RESET => RESET,
          CLK => CLK,
          INPUT => INPUT,
          OUTPUT => OUTPUT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLKP/2;
		CLK <= '1';
		wait for CLKP/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		RESET <= '1';
      wait for 4 * CLKP;
		RESET <= '0';
		WR <= '0';
		INPUT <= "00001111";
		wait for CLKP;
		assert OUTPUT = "00000000" severity failure;
		WR <= '1';
		wait for CLKP;
		assert OUTPUT = "00001111" severity failure;
		INPUT <= "11110000";
		wait for CLKP;
		assert OUTPUT = "11110000" severity failure;
		
      wait;
   end process;

END;
