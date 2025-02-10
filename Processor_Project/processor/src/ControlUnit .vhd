library IEEE;
use IEEE.std_logic_1164.all;

entity Control_U is
	generic(n:integer:=16);
	 port(
		 MR,MW,ALU_EN : out STD_LOGIC;
		 OPcode : in STD_LOGIC_VECTOR(3 downto 0)
	     );
end Control_U;

--}} End of automatically maintained section

architecture Control_U of Control_U is 
signal w , r :std_logic;
begin

r <='1' when OPcode="0000" else '0';	   ---load---
w <='1' when OPcode="0001" else '0';	   ---store---
ALU_EN <='1' when (r ='0' and w ='0') else '0';	---ALU operations---
MR <= r;
MW <= w;
end Control_U;
