library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

library work;
use work.rVEX_pkg.all;

entity counter is
   
    port (
        clk : in std_logic;
        rst : in std_logic;
        Q : out std_logic_vector (DMEM_LOGDEP-1 downto 0));

    end counter;

architecture bheav of counter is
    signal cnt : std_logic_vector(DMEM_LOGDEP-1 downto 0);
begin
    process (clk)
        begin
            if rising_edge(clk) then
                if (rst = '1') then
                cnt <= (others => '0');
            else
                cnt <= cnt + '1';
            end if;
        end if;
        
end process;
    Q (DMEM_LOGDEP-1 downto 0) <= cnt (DMEM_LOGDEP-1 downto 0);
end bheav;
