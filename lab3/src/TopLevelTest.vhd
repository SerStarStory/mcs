LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY TopLevel_TopLevel_sch_tb IS
END TopLevel_TopLevel_sch_tb;
ARCHITECTURE behavioral OF TopLevel_TopLevel_sch_tb IS 

   COMPONENT TopLevel
   PORT( CLOCK	:	IN	STD_LOGIC; 
          RESET	:	IN	STD_LOGIC; 
          ENTER_OP1	:	IN	STD_LOGIC; 
          ENTER_OP2	:	IN	STD_LOGIC; 
          CALCULATE	:	IN	STD_LOGIC; 
          DATA_IN	:	IN	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          COMMON_0_OUT	:	OUT	STD_LOGIC; 
          COMMON_1_OUT	:	OUT	STD_LOGIC; 
          COMMON_2_OUT	:	OUT	STD_LOGIC; 
			 TEST: OUT STD_LOGIC_VECTOR(7 downto 0);
          A_OUT	:	OUT	STD_LOGIC; 
          B_OUT	:	OUT	STD_LOGIC; 
          C_OUT	:	OUT	STD_LOGIC; 
          D_OUT	:	OUT	STD_LOGIC; 
          E_OUT	:	OUT	STD_LOGIC; 
          F_OUT	:	OUT	STD_LOGIC; 
          G_OUT	:	OUT	STD_LOGIC; 
          DP_OUT	:	OUT	STD_LOGIC; 
          OVERFLOW	:	OUT	STD_LOGIC);
   END COMPONENT;

   SIGNAL CLOCK	:	STD_LOGIC := '0';
   SIGNAL RESET	:	STD_LOGIC;
   SIGNAL ENTER_OP1	:	STD_LOGIC;
   SIGNAL ENTER_OP2	:	STD_LOGIC;
   SIGNAL CALCULATE	:	STD_LOGIC;
   SIGNAL DATA_IN	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL COMMON_0_OUT	:	STD_LOGIC;
   SIGNAL COMMON_1_OUT	:	STD_LOGIC;
   SIGNAL COMMON_2_OUT	:	STD_LOGIC;
   SIGNAL A_OUT	:	STD_LOGIC;
   SIGNAL B_OUT	:	STD_LOGIC;
   SIGNAL C_OUT	:	STD_LOGIC;
   SIGNAL D_OUT	:	STD_LOGIC;
   SIGNAL E_OUT	:	STD_LOGIC;
   SIGNAL F_OUT	:	STD_LOGIC;
   SIGNAL G_OUT	:	STD_LOGIC;
   SIGNAL DP_OUT	:	STD_LOGIC;
   SIGNAL OVERFLOW	:	STD_LOGIC;
	SIGNAL TEST: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL TEST1: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL TEST2: STD_LOGIC_VECTOR(7 downto 0);
	
--	constant CLOCK_period : time := 166ns;
	constant CLKP: time := 24ms;--48ms;

BEGIN

   UUT: TopLevel PORT MAP(
		CLOCK => CLOCK, 
		RESET => RESET, 
		ENTER_OP1 => ENTER_OP1, 
		ENTER_OP2 => ENTER_OP2, 
		CALCULATE => CALCULATE, 
		DATA_IN => DATA_IN, 
		COMMON_0_OUT => COMMON_0_OUT, 
		COMMON_1_OUT => COMMON_1_OUT, 
		COMMON_2_OUT => COMMON_2_OUT, 
		A_OUT => A_OUT, 
		B_OUT => B_OUT, 
		C_OUT => C_OUT, 
		D_OUT => D_OUT, 
		E_OUT => E_OUT, 
		F_OUT => F_OUT, 
		G_OUT => G_OUT, 
		DP_OUT => DP_OUT, 
		OVERFLOW => OVERFLOW,
		TEST => TEST
   );
	
	CLOCK_process: process
   begin
		CLOCK <= '0';
		wait for 83ns;
		CLOCK <= '1';
		wait for 83ns;
  end process;

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
		--ENTER_OP1 <= '0';
		--ENTER_OP2 <= '0';
		--CALCULATE <= '0';
		--DATA_IN <= (others => '0');
		--RESET <= '1';
		--wait for CLKP * 4;
		--RESET <= '0';
		--DATA_IN <= "00000000"; -- A
		--ENTER_OP1 <= '1';
		--wait for CLKP * 4;
		--ENTER_OP1 <= '0';
		--wait for CLKP * 4;
		--DATA_IN <= "00000001"; -- B
		--ENTER_OP2 <= '1';
		--wait for CLKP * 4;
		--ENTER_OP2 <= '0';
		--wait for CLKP * 4;
		--CALCULATE <= '1'; -- START CALCULATION
		
		lp1: for i in 1 to 1 loop
			lp2: for j in 2 to 2 loop
				TEST1 <= std_logic_vector(to_unsigned(i, 8)) nor std_logic_vector(to_unsigned(j, 8));
				TEST2 <= std_logic_vector(to_unsigned(to_integer(signed(std_logic_vector(to_signed(i, 8)) nor std_logic_vector(to_unsigned(j, 8)))) + j + 7, 8));
				ENTER_OP1 <= '1';
				ENTER_OP2 <= '1';
				CALCULATE <= '1';
				DATA_IN <= (others => '0');
				RESET <= '0';
				wait for CLKP;
				RESET <= '1';
				wait for CLKP;
				DATA_IN <= std_logic_vector(to_unsigned(i, 8)); -- A
				ENTER_OP1 <= '0';
				wait for CLKP;
				ENTER_OP1 <= '1';
				wait for CLKP;
				DATA_IN <= std_logic_vector(to_unsigned(j, 8)); -- B
				ENTER_OP2 <= '0';
				wait for CLKP;
				ENTER_OP2 <= '1';
				wait for CLKP;
				CALCULATE <= '0'; -- START CALCULATION
				wait for CLKP* 7;
				assert TEST = TEST2 severity FAILURE;
				wait for CLKP;
			end loop;
		end loop;
		
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
