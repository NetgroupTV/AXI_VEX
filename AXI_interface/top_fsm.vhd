library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.rVEX_pkg.all;

entity top_axi_vex_interface is

 port(

    data_in       : in  std_logic_vector(DMEM_WIDTH-1 downto 0);
    data_valid : in  std_logic;
    clk         : in  std_logic;
    add_read : in integer := 0;
    data_out_t : out std_logic_vector(DMEM_WIDTH-1 downto 0);
    rst_cnt : in std_logic);

end top_axi_vex_interface;

architecture structural of top_axi_vex_interface is

signal write_address : natural :=0 ;

begin

CNT : entity work.counter port map (clk,rst_cnt,write_address);


RAM : entity work.dual_port_ram port map (data_out_t,data_in,data_valid,add_read,write_address,clk);

end structural;
