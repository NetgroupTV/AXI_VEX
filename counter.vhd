library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

entity counter is
    generic (
        WIDTH : natural := 8); -- address bus width
    port (
        clk : in std_logic;
        rst : in std_logic;
        Q : out integer :=0);

    end counter;

architecture bheav of counter is
    signal cnt : std_logic_vector(WIDTH-1 downto 0);
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
    Q <= (conv_integer(cnt));
end bheav;
