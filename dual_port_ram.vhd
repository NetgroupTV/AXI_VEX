library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dual_port_ram is
    generic (
    
    LENGTH : natural := 8;
    WIDTH : natural := 8
    );
    
  port(
    data_out        : out std_logic_vector(LENGTH-1 downto 0);

    data_in       : in  std_logic_vector(LENGTH-1 downto 0);
    we : in  std_logic;
    read_add     : in  std_logic_vector(WIDTH-1 downto 0);

    write_add : in  std_logic_vector(WIDTH-1 downto 0);
    clk         : in  std_logic
    );
end dual_port_ram;

architecture behavioral of dual_port_ram is
  type registerFile is array(0 to WIDTH-1) of std_logic_vector(LENGTH-1 downto 0);
  signal registers : registerFile;
begin
  regFile : process (clk) is
  begin
    if rising_edge(clk) then
      -- Read A and B before bypass
      data_out <= registers(to_integer(unsigned(read_add)));
      
      -- Write and bypass
      if we = '1' then
        registers(to_integer(unsigned(write_add))) <= data_in;  -- Write
        if read_add = write_add then  -- Bypass for read A
          data_out <= data_in;
        end if;
       
      end if;
    end if;
  end process;
end behavioral;