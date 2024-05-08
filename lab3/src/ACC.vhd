library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ACC is
    Port ( WR   : in  STD_LOGIC;
           RESET  : in  STD_LOGIC;
           CLK  : in  STD_LOGIC;
           INPUT : in  STD_LOGIC_VECTOR (7 downto 0);
           OUTPUT : out  STD_LOGIC_VECTOR (7 downto 0));
end ACC;

architecture ACC_arch of ACC is
    signal DATA : STD_LOGIC_VECTOR (7 downto 0);
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                DATA <= (others => '0'); 
            elsif WR = '1' then
                DATA <= INPUT; 
            end if;
        end if;
    end process;

   
    OUTPUT <= DATA;

end ACC_arch;
