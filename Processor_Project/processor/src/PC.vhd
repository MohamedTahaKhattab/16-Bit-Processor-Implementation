library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity PC is
	generic(n:integer:=16);
	 port(
		 Rst : in STD_LOGIC;
		 CLK : in STD_LOGIC;
		 PCin : in STD_LOGIC_VECTOR(n-1 downto 0);
		 PCout : out STD_LOGIC_VECTOR(n-1 downto 0)
	     );
end PC;

--}} End of automatically maintained section

architecture PC of PC is 
signal s1 : std_logic_vector(n-1 downto 0);
begin 
process(Rst,CLK)
begin
if Rst='1' then s1 <= x"FFFF";
elsif Rst='0' and rising_edge(CLK) then 
    s1<=PCin;
	PCout<=s1+1;
end if;		
end process;
end PC;

