library IEEE;
use IEEE.std_logic_1164.all;

entity PartB is	 
	generic(
	 n:Integer :=16
	);
	 port(
		
		 A : in STD_LOGIC_VECTOR(n-1 downto 0);
		 B : in STD_LOGIC_VECTOR(n-1 downto 0);
		 S : in STD_LOGIC_VECTOR(1 downto 0);
		 F : out STD_LOGIC_VECTOR(n-1 downto 0)
	     );
end PartB;

--}} End of automatically maintained section

architecture PartB_model of PartB is
begin

	-- enter your statements here -- 
F <= (A and B) when S = "00" else	
           (A or B) when S = "01" else
           (A xor B) when S = "10" else
	       (not A) when S = "11" ;
	

end PartB_model;
