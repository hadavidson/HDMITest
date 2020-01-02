module HDMI_test(input clk, output [2:0] TMDSp, TMDSn, output TMDSp_clock, TMDSn_clock, output [7:0] led, input [3:0] dip);

///////////////////////////////////////////////////////////////////////////////
	//create variables
	wire [7:0] red, green, blue;
	wire [11:0] x, y;
	wire pixclk, clk_TMDS, hSync, vSync, DrawArea, animate;
	wire [3:0] pixRd;

///////////////////////////////////////////////////////////////////////////////
	//call modules

	//create clocks
	pixelClk pxlc(.inclk0(clk),.c0(pixclk),.c1(clk_TMDS));
	sdramPll sdrc(.inclk0(clk),.c0(mem_clk));

	//create HDMI sync points
	HvSync HVS1 (.pixclk(pixclk), .CounterX(x), .CounterY(y), .hSync(hSync), .vSync(vSync), .DrawArea(DrawArea), .animate(animate));

	//genarate HDMI output
	CreateHDMIOutputs CHIO1 (.pixclkI(pixclk), .clk_TMDSI(clk_TMDS), .hSyncI(hSync), .vSyncI(vSync), .DrawAreaI(DrawArea), .redI(red), .greenI(green), .blueI(blue), .TMDSpO(TMDSp), .TMDSnO(TMDSn), .TMDSp_clockO(TMDSp_clock), .TMDSn_clockO(TMDSn_clock));

	//crate speed segment
	speedCluster SPEED1 (.animate(animate), .x(x), .y(y), .pixRd(pixRd));
	
	//set color on hdmi out
	assighColor AC1 (.pixclk(pixclk), .DrawArea(DrawArea), .pixRd(pixRd), .red(red), .green(green), .blue(blue));
		
	//assign led = sP7m;//test spot
endmodule
