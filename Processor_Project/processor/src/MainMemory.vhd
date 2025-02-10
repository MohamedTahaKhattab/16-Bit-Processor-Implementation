library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity \Main Memory\ is	 
	generic(
		  n : Integer :=16
	);
	 port(
		 clk : in STD_LOGIC;
		 rst : in STD_LOGIC;
		 MR : in STD_LOGIC;
		 MW : in STD_LOGIC;
		 address : in STD_LOGIC_VECTOR(n-1 downto 0);
		 WD : in STD_LOGIC_VECTOR(n-1 downto 0);									   
		 RD : out STD_LOGIC_VECTOR(n-1 downto 0)
	     );
end \Main Memory\;

--}} End of automatically maintained section

architecture \Main_Memory_model\ of \Main Memory\ is 
type RAM_TYPE is array(0to((2**(n-1)-1)))of std_logic_vector(n-1 downto 0);
type ROM_TYPE is array(0 to 15)of std_logic_vector(n-1 downto 0);
signal ram : RAM_TYPE;
signal rom : ROM_TYPE; 
signal EN:std_logic;
begin  
	EN <='1' when MR = '1' or MW = '1'else '0';
process (clk,EN,rst)
begin	
if (rst='1')then 
	 -- memory locations (contents) --
ram(3630)<=x"0002";	 ---E2E---
ram(3631)<=x"0001";	 ---E2F---
ram(3632)<=x"0008";	 ---E30---
ram(3633)<=x"0007";	 ---E31---
ram(3634)<=x"0005";	 ---E32---
ram(3635)<=x"0003";	 ---E33---
ram(3636)<=x"0F0F";	 ---E34---
ram(3637)<=x"000A";	 ---E35---
ram(3638)<=x"0000";	 ---E36---										  
     -- Instructions --									---test case: ((2+10-8)+1)-1 = 4
rom(0)<=	x"0E2E"	;  ---load---						---load 2
rom(1)<=	x"2E35"	;  ---add---		   			    ---add 10
rom(2)<=	x"1E30"	;  ---sub---						---sub 8 
rom(3)<=	x"0E32"	;  ---store---						---store 4 in E32 
rom(4)<=	x"DE32"	;  ---inc---						---Inc
rom(5)<=	x"1E2F"	;  ---store---						---store 5 in E2F
rom(6)<=	x"0E2F"	;  ---dec---						---Dec
rom(7)<=	x"EE33"	;  ---store---						---store 4 in E33
--------------------------------------
elsif (rising_edge(clk)) and MR = '0' and MW = '0' Then
	RD <= rom(to_integer(unsigned(address)));
elsif(rising_edge(clk))and MW ='1' then
	ram(to_integer(unsigned(address))) <= WD;
elsif(rising_edge(clk)) and MR = '1' Then
	RD <= ram(to_integer(unsigned(address(11 downto 0))));
elsif (rising_edge(Clk)) and EN='1' and address /= "XXXXXXXXXXXXXXXX" and address /= "ZZZZZZZZZZZZZZZZ"then
		RD <= rom(to_integer(unsigned(Address)));
		
end if;	
end process;
end \Main_Memory_model\ ;
	