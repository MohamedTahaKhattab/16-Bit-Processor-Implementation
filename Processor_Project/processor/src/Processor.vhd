library IEEE;
use IEEE.std_logic_1164.all;

entity Processor is
	generic( n:integer:=16);
	 port(
		 CLK : in STD_LOGIC;
		 Rst : in STD_LOGIC
	     );
end Processor;

--}} End of automatically maintained section

architecture Processor of Processor is 
component ALU is 
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
end component; 
component \Main Memory\ is	 
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
end component; 
component \Register\ is
	generic(n:integer :=16);
	 port(
		 CLK : in STD_LOGIC;
		 Rst : in STD_LOGIC;
		 Datain : in STD_LOGIC_VECTOR(n-1 downto 0);
		 Dataout : out STD_LOGIC_VECTOR(n-1 downto 0)
	     );
end component; 
component PC is
	generic(n:integer:=16);
	 port(
		 Rst : in STD_LOGIC;
		 CLK : in STD_LOGIC;
		 PCin : in STD_LOGIC_VECTOR(n-1 downto 0);
		 PCout : out STD_LOGIC_VECTOR(n-1 downto 0)
	     );
end component;	
component Control_U is
	generic(n:integer:=16);
	 port(
		 MR,MW,ALU_EN : out STD_LOGIC;
		 OPcode : in STD_LOGIC_VECTOR(3 downto 0)
	     );
end component; 
component ALU_Selc is
	generic(n:integer:=16);
	port(
	 	 EN : in STd_logic;
		 OPcode : in STD_LOGIC_VECTOR(3 downto 0);							
		 S : out STD_LOGIC_VECTOR(3 downto 0);
		 Carry : out STD_LOGIC
	     );
end component;
signal mr,mw,aluen,Cin,Cout,Negativeflag,Zeroflag,Carryflag : std_logic;
signal pcout,pcin,addr,wd,rd,F,AC,B: std_logic_vector(n-1 downto 0);
signal S,opcode :std_logic_vector(3 downto 0);
signal data_in,data_out: std_logic_vector(n-1 downto 0);
signal s_addr:std_logic_vector(11 downto 0);
begin 
	p_c : PC port map(Rst,CLK,pcin,pcout);
	buf : \Register\ port map(CLK,Rst,data_in,data_out);
	addr<=("0000"&s_addr) when mr='1' or mw='1' else pcout;
	m_m : \Main Memory\ port map(CLK,Rst,mr,mw,addr,wd,rd);
	C_U : Control_U port map(mr,mw,aluen,rd(15 downto 12));
	sel : ALU_Selc port map(aluen,rd(15 downto 12),S,Cin); 
	a_l_u: ALU port map(Cin,Cout,AC,rd,S,F,Negativeflag,Zeroflag,Carryflag);
	pcin<=pcout;
	S_addr<=RD(11 downto 0);
	AC<= F when aluen = '1' else rd;
end Processor;
