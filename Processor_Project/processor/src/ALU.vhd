library IEEE;
use IEEE.std_logic_1164.all;

entity ALU is  
	generic(
	 n:Integer :=16
	);
	 port(
		 CIN : in STD_LOGIC;
		 COUT : out STD_LOGIC;
		 A : in STD_LOGIC_VECTOR(n-1 downto 0);
		 B : in STD_LOGIC_VECTOR(n-1 downto 0);
		 S : in STD_LOGIC_VECTOR(3 downto 0);
		 F : out STD_LOGIC_VECTOR(n-1 downto 0);
		 Negativeflag : out std_logic;
		 Zeroflag : out std_logic;
		 Carryflag : out std_logic
	     );
end ALU;

--}} End of automatically maintained section

architecture ALU of ALU is
component PartA is	
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
end component;
component PartB is	 
	generic(
	 n:Integer :=16
	);
	 port(
		
		 A : in STD_LOGIC_VECTOR(n-1 downto 0);
		 B : in STD_LOGIC_VECTOR(n-1 downto 0);
		 S : in STD_LOGIC_VECTOR(1 downto 0);
		 F : out STD_LOGIC_VECTOR(n-1 downto 0)
	     );
end component;
component PartC is
	generic(
	 n:Integer :=16
	);
	 port(
	     A : in STD_LOGIC_VECTOR(n-1 downto 0);
	     CIN :in STd_logic;
		 S : in STD_LOGIC_VECTOR(1 downto 0);
		 F : out STD_LOGIC_VECTOR(n-1 downto 0)
	     );
end component;
component PartD is	
	generic(
	 n:Integer :=16
	);
	 port(
		 CIN : in STD_LOGIC;
		 A : in STD_LOGIC_VECTOR(n-1 downto 0);
		 S : in STD_LOGIC_VECTOR(1 downto 0);
		 F : out STD_LOGIC_VECTOR(n-1 downto 0)
	     );
end component;
signal s1 ,s2 : std_logic_vector(1 downto 0);
signal o,l,c,d,e : std_logic_vector(n-1 downto 0);
signal g,h : std_logic;
begin
s1 <= S(1 downto 0);
s2 <= S(3 downto 2);

ParA : PartA port map (CIN,A,B,s1,o,g);
ParB : PartB port map (A,B,s1,l);
ParC : PartC port map (A,CIN,s1,c);	
ParD : PartD port map (CIN,A,s1,d);
e <= o when s2 ="00" else l when s2 ="01" else c when s2 ="10" else d when s2 ="11";	
h <= g when s2 ="00" else '0';
Negativeflag <= '1' when e(n-1) ='1' else '0';
Zeroflag <= '1' when e = x"0000" else '0';
Carryflag <= '1' when h ='1' else '0';		 
F <= e ;
COUT <= h;
end ALU;
