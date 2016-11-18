library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity top_fsm is

generic (
        
     LENGTH : natural := 8;
     WIDTH : natural := 8
);
    
  port(
 
    data_in       : in  std_logic_vector(LENGTH-1 downto 0);
    data_valid : in  std_logic;
    clk         : in  std_logic;
    add_read : in std_logic_vector(WIDTH-1 downto 0);
    data_out_t : out std_logic_vector(LENGTH-1 downto 0);
    rst_cnt : in std_logic
    );
end top_fsm;

architecture structural of top_fsm is

component dual_port_ram
    
  port(
    data_out        : out std_logic_vector(LENGTH-1 downto 0);

    data_in       : in  std_logic_vector(LENGTH-1 downto 0);
    we : in  std_logic;
    read_add     : in  std_logic_vector(WIDTH-1 downto 0);

    write_add : in  std_logic_vector(WIDTH-1 downto 0);
    clk         : in  std_logic
    );

end component;

component counter
   
    port (
        clk : in std_logic;
        rst : in std_logic;
        Q : out std_logic_vector(WIDTH-1 downto 0));
    end component;

--signal clock: std_logic;
--signal input : std_logic_vector(LENGTH-1 downto 0);
--signal output : std_logic_vector(LENGTH-1 downto 0);
--signal valid : std_logic;
--signal read_address : std_logic_vector(WIDTH-1 downto 0);
--signal reset_count: std_logic;
signal write_address : std_logic_vector(WIDTH-1 downto 0);


begin

CNT : counter port map (

        clk => clk,
        rst => rst_cnt,
        Q (WIDTH -1 downto 0) => write_address(WIDTH -1 downto 0)
        );
        
RAM : dual_port_ram port map (
        
        we => data_valid,
        clk => clk,
        write_add(WIDTH -1 downto 0) => write_address(WIDTH -1 downto 0),
        data_out(LENGTH-1 downto 0) => data_out_t(LENGTH-1 downto 0),
        data_in (LENGTH-1 downto 0) => data_in(LENGTH-1 downto 0),
        read_add (WIDTH -1 downto 0) => add_read(WIDTH -1 downto 0)
        );
        
 
 
        

end structural;
