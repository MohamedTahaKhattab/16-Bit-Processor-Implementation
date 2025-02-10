library IEEE;
use IEEE.std_logic_1164.all;

entity ALU_Selc is
	generic(n:integer:=16);
	port(
	 	 EN : in STd_logic;
		 OPcode : in STD_LOGIC_VECTOR(3 downto 0);
		 S : out STD_LOGIC_VECTOR(3 downto 0);
		 Carry : out STD_LOGIC
	     );
end ALU_Selc;

--}} End of automatically maintained section

architecture ALU_Selc of ALU_Selc is
begin

S <= "0001" when OPcode="0010" and EN='1' 		-----CIN=0-----				-----ADD-----
else "0010"	when OPcode="0011" and EN='1'		-----CIN=1-----				-----SUB-----
else "0100" when OPcode="0100" and EN='1'									-----AND-----
else "0101" when OPcode="0101" and EN='1'									-----OR------
else "0110" when OPcode="0110" and EN='1'							        -----XOR-----
else "0111" when OPcode="0111" and EN='1'								    -----NOT-----
else "1100" when OPcode="1000" and EN='1'							    	-----SHL-----
else "1000" when OPcode="1001" and EN='1'								    -----SHR-----
else "1101" when OPcode="1010" and EN='1'									-----ROL-----
else "1001" when OPcode="1011" and EN='1'	   							    -----ROR-----
else "0000" when OPcode="1101" and EN='1'		-----CIN=1-----         	-----Inc-----
else "0011" when OPcode="1110" and EN='1'		-----CIN=0-----				-----Dec-----
else "1111" when OPcode="1111" and EN='1';								    -----Rst----- 

	
Carry<='1' when OPcode="0011" and OPcode="1101" and EN='1' else '0';

end ALU_Selc;
