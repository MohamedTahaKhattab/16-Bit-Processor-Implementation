library IEEE;
use IEEE.std_logic_1164.all;

entity \Register\ is
	generic(n:integer :=16);
	 port(
		 CLK : in STD_LOGIC;
		 Rst : in STD_LOGIC;
		 Datain : in STD_LOGIC_VECTOR(n-1 downto 0);
		 Dataout : out STD_LOGIC_VECTOR(n-1 downto 0)
	     );
end \Register\;

--}} End of automatically maintained section

architecture \Register\ of \Register\ is
begin

process(CLK,Rst)
begin
if Rst='1' then Dataout<=(others=>'Z');
elsif Rst='0' and rising_edge(CLK) then Dataout	<= Datain;
end if;	
end process;
end \Register\;
