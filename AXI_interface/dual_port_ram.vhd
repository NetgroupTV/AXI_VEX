library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

use work.rVEX_pkg.all;

entity dual_port_ram is

generic (AXI_OUT_WIDTH : natural := 256);
    
  port(
    data_out        : out std_logic_vector(DMEM_WIDTH-1 downto 0);

    data_in       : in  std_logic_vector(AXI_OUT_WIDTH-1 downto 0);
    we : in  std_logic;

    read_add     : in  std_logic_vector(DMEM_LOGDEP-1 downto 0) ;

    write_add : in  std_logic_vector (DMEM_LOGDEP-1 downto 0);
    clk         : in  std_logic
    );
end dual_port_ram;



architecture behavioral of dual_port_ram is

type registerFile is array(0 to 8) of std_logic_vector(AXI_OUT_WIDTH-1 downto 0);
signal registers : registerFile;                                                     
signal temp : std_logic_vector(255 downto 0);


begin
process(clk)

begin
    if(rising_edge(clk)) then
           
            temp <= registers(conv_integer(read_add(7 downto 3)));
    end if;
end process;

data_out<= temp(255 downto 224) when read_add(2 downto 0)="111" else
           temp(223 downto 192) when read_add(2 downto 0)="110" else
           temp(191 downto 160) when read_add(2 downto 0)="101" else
           temp(159 downto 128) when read_add(2 downto 0)="100" else
           temp(127 downto 96) when read_add(2 downto 0)="011" else
           temp(95 downto 64) when read_add(2 downto 0)="010" else
           temp(63 downto 32) when read_add(2 downto 0)="001" else
           temp(31 downto 0) when read_add(3 downto 0)="000";

process(clk)
begin
        
        if(rising_edge(clk)) then
            if(we = '1') then
                registers(conv_integer(write_add)) <= data_in;
            end if;
            
    end if;
end process;
end behavioral;
