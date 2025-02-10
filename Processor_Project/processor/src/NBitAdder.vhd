library IEEE;
use IEEE.std_logic_1164.all;

entity \add_sub\ is	 
	generic(
		  n : Integer :=16
	);
	 port(
		 CIN : in STD_LOGIC;
		 A : in STD_LOGIC_VECTOR(n-1 downto 0);
		 B : in STD_LOGIC_VECTOR(n-1 downto 0);
		 S : out STD_LOGIC_VECTOR(n-1 downto 0);
		 COUT : out std_logic
	     );
end \add_sub\;
							 			 		  
architecture \Add_sub_model\ of \add_sub\ is
component FA is
	 port(
		 A : in STD_LOGIC;
		 B : in STD_LOGIC;
		 CIN : in STD_LOGIC;
		 S : out STD_LOGIC;
		 COUT : out STD_LOGIC
	     );
end component;
signal temp: std_logic_vector(n downto 0);
begin
temp(0) <= CIN;
Loop1 : for i in 0 to n-1 generate
	adder: FA port map (A(i),B(i),temp(i),S(i),temp(i+1));
end generate;
COUT <= temp(n);

end \Add_sub_model\;