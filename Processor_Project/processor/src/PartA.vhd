library IEEE;
use IEEE.std_logic_1164.all;

entity PartA is	
	generic(
	 n:Integer :=16
	);
	 port(
	     CIN : in STD_LOGIC;
		 A : in STD_LOGIC_VECTOR(n-1 downto 0);
		 B : in STD_LOGIC_VECTOR(n-1 downto 0);
		 S : in STD_LOGIC_VECTOR(1 downto 0);
		 F : out STD_LOGIC_VECTOR(n-1 downto 0);
		  COUT : out std_logic
	     );
end PartA;

--}} End of automatically maintained section

architecture \PartA_model\ of PartA is
component \add_sub\ is	 
	generic(
		  n : Integer :=16
	);
	 port(
		 CIN : in STD_LOGIC;
		 A : in STD_LOGIC_VECTOR(n-1 downto 0);
		 B : in STD_LOGIC_VECTOR(n-1 downto 0);
		 S : out STD_LOGIC_VECTOR(n-1 downto 0);
		 COUT : out STD_LOGIC
	     );
end component;
signal t,c,e,o,h,j:std_logic_vector(n-1 downto 0);
signal p,d,g,i,k:STD_LOGIC;
begin 
	  e <= not B;
	add1 : \add_sub\ port map(CIN,A,x"0000",t,p);
	add2 : \add_sub\ port map(CIN,A,B,c,d);
	add3 : \add_sub\ port map('1',A,e,o,g);
	add4 : \add_sub\ port map(CIN,o,x"1111",h,i);
	add5 : \add_sub\ port map('0',A,x"1111",j,k);
F <= t when S = "00" else c when S = "01" else h when S ="10" and CIN = '0' else o when S ="10" and CIN = '1' else
j when S = "11"	and CIN = '0' else x"0000" when S = "11" and CIN = '1' ; 

COUT <= p when S = "00" else d when S = "01" else i when S ="10" and CIN = '0' else g when S ="10" and CIN = '1' else
k when S = "11"	and CIN = '0' else '0' when S = "11" and CIN = '1' ;

end \PartA_model\ ;
