library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity counter is
    generic (
        WIDTH : natural := 8);
    port (
        clk : in std_logic;
        rst : in std_logic;
        Q : out std_logic_vector(WIDTH-1 downto 0));
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
    Q <= cnt;
end bheav;