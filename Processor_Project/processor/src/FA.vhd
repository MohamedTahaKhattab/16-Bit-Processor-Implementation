library IEEE;
use IEEE.std_logic_1164.all;

entity FA is
	 port(
		 A : in STD_LOGIC;
		 B : in STD_LOGIC;
		 CIN : in STD_LOGIC;
		 S : out STD_LOGIC;
		 COUT : out STD_LOGIC
	     );
end FA;

--}} End of automatically maintained section

architecture FA of FA is
begin

	-- enter your statements here --
	S <= A Xor B Xor CIN;
	COUT <= ((A xor B) and CIN) or (A and B);

end FA;
