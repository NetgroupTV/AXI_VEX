library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
USE ieee.std_logic_arith.all;

library work;
use work.rVEX_pkg.all;

entity dual_port_ram is

    
  port(
    data_out        : out std_logic_vector(DMEM_WIDTH-1 downto 0);

    data_in       : in  std_logic_vector(DMEM_WIDTH-1 downto 0);
    we : in  std_logic;

    read_add     : in  integer ;

    write_add : in  integer;
    clk         : in  std_logic
    );
end dual_port_ram;

architecture behavioral of dual_port_ram is

type registerFile is array(0 to DMEM_DEPTH-1) of std_logic_vector(DMEM_WIDTH-1 downto 0);
signal registers : registerFile;                                                     

begin
process(clk)
begin
    if(rising_edge(clk)) then
            data_out<= registers(conv_integer(read_add));
    end if;
end process;

process(clk)
begin
        
        if(rising_edge(clk)) then
            if(we = '1') then
                registers(conv_integer(write_add)) <= data_in;
            end if;
            
    end if;
end process;
end behavioral;
