library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_fsm is
generic (

     LENGTH : natural := 8; --data bus width
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

signal write_address : std_logic_vector(WIDTH-1 downto 0);


begin

CNT : entity work.counter port map (clk,rst_cnt,write_address);


RAM : work.dual_port_ram port map (data_valid,clk,write_address,data_out,data_in,read_add);

end structural;
