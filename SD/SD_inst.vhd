	component SD is
		port (
			sdram_wire_addr  : out   std_logic_vector(11 downto 0);                    -- addr
			sdram_wire_ba    : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_wire_cas_n : out   std_logic;                                        -- cas_n
			sdram_wire_cke   : out   std_logic;                                        -- cke
			sdram_wire_cs_n  : out   std_logic;                                        -- cs_n
			sdram_wire_dq    : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- dq
			sdram_wire_dqm   : out   std_logic;                                        -- dqm
			sdram_wire_ras_n : out   std_logic;                                        -- ras_n
			sdram_wire_we_n  : out   std_logic;                                        -- we_n
			clk_clk          : in    std_logic                     := 'X';             -- clk
			reset_reset      : in    std_logic                     := 'X';             -- reset
			sdram_clk_clk    : out   std_logic                                         -- clk
		);
	end component SD;

	u0 : component SD
		port map (
			sdram_wire_addr  => CONNECTED_TO_sdram_wire_addr,  -- sdram_wire.addr
			sdram_wire_ba    => CONNECTED_TO_sdram_wire_ba,    --           .ba
			sdram_wire_cas_n => CONNECTED_TO_sdram_wire_cas_n, --           .cas_n
			sdram_wire_cke   => CONNECTED_TO_sdram_wire_cke,   --           .cke
			sdram_wire_cs_n  => CONNECTED_TO_sdram_wire_cs_n,  --           .cs_n
			sdram_wire_dq    => CONNECTED_TO_sdram_wire_dq,    --           .dq
			sdram_wire_dqm   => CONNECTED_TO_sdram_wire_dqm,   --           .dqm
			sdram_wire_ras_n => CONNECTED_TO_sdram_wire_ras_n, --           .ras_n
			sdram_wire_we_n  => CONNECTED_TO_sdram_wire_we_n,  --           .we_n
			clk_clk          => CONNECTED_TO_clk_clk,          --        clk.clk
			reset_reset      => CONNECTED_TO_reset_reset,      --      reset.reset
			sdram_clk_clk    => CONNECTED_TO_sdram_clk_clk     --  sdram_clk.clk
		);

