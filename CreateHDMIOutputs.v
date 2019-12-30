module CreateHDMIOutputs(input pixclkI, clk_TMDSI, hSyncI, vSyncI, DrawAreaI, input [7:0] redI, greenI, blueI, output [2:0] TMDSpO, TMDSnO, output TMDSp_clockO, TMDSn_clockO);
	
	//create output colors
	wire [9:0] TMDS_redI, TMDS_greenI, TMDS_blueI;
	TMDS_encoder encode_R(.clk(pixclkI), .VD(redI), .CD(2'b00), .VDE(DrawAreaI), .TMDS(TMDS_redI));
	TMDS_encoder encode_G(.clk(pixclkI), .VD(greenI), .CD(2'b00), .VDE(DrawAreaI), .TMDS(TMDS_greenI));
	TMDS_encoder encode_B(.clk(pixclkI), .VD(blueI), .CD({vSyncI,hSyncI}), .VDE(DrawAreaI), .TMDS(TMDS_blueI));

	////////////////////////////////////////////////////////////////////////
	reg [3:0] TMDS_mod10=0;  // modulus 10 counter
	reg [9:0] TMDS_shift_redI=0, TMDS_shift_greenI=0, TMDS_shift_blueI=0;
	reg TMDS_shift_load=0;
	always @(posedge clk_TMDSI) TMDS_shift_load <= (TMDS_mod10==4'd9);

	always @(posedge clk_TMDSI)
	begin
		TMDS_shift_redI   <= TMDS_shift_load ? TMDS_redI   : TMDS_shift_redI  [9:1];
		TMDS_shift_greenI <= TMDS_shift_load ? TMDS_greenI : TMDS_shift_greenI[9:1];
		TMDS_shift_blueI  <= TMDS_shift_load ? TMDS_blueI  : TMDS_shift_blueI [9:1];	
		TMDS_mod10 <= (TMDS_mod10==4'd9) ? 4'd0 : TMDS_mod10+4'd1;
	end

	altiobuf altobuf_redI(.datain(TMDS_shift_redI[0]),	.dataout(TMDSpO[2]),.dataout_b(TMDSnO[2]));
	altiobuf altobuf_greenI(.datain(TMDS_shift_greenI[0]),.dataout(TMDSpO[1]),.dataout_b(TMDSnO[1]));
	altiobuf altobuf_blueI(.datain(TMDS_shift_blueI[0]),	.dataout(TMDSpO[0]),.dataout_b(TMDSnO[0]));
	altiobuf altobuf_clock(.datain(pixclkI), .dataout(TMDSp_clockO), .dataout_b(TMDSn_clockO));
endmodule
