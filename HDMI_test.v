module HDMI_test(input clk, output [2:0] TMDSp, TMDSn, output TMDSp_clock, TMDSn_clock, output [7:0] led, input [3:0] dip);

///////////////////////////////////////////////////////////////////////////////
	//create variables

	//pic variables
	reg [7:0] red, green, blue;
	wire [11:0] x, y;
	wire pixclk, clk_TMDS, hSync, vSync, DrawArea, animate;
	wire [11:0] o_x1, o_x2, o_y1, o_y2;
	wire display;
	reg goAnimate=1;

///////////////////////////////////////////////////////////////////////////////
	//call modules

	//create clocks
	pixelClk pxlc(.inclk0(clk),.c0(pixclk),.c1(clk_TMDS));
	sdramPll sdrc(.inclk0(clk),.c0(mem_clk));

	//create HDMI sync points
	HvSync HVS1 (.pixclk(pixclk), .CounterX(x), .CounterY(y), .hSync(hSync), .vSync(vSync), .DrawArea(DrawArea), .animate(animate));

	//genarate HDMI output
	CreateHDMIOutputs CHIO1 (.pixclkI(pixclk), .clk_TMDSI(clk_TMDS), .hSyncI(hSync), .vSyncI(vSync), .DrawAreaI(DrawArea), .redI(red), .greenI(green), .blueI(blue), .TMDSpO(TMDSp), .TMDSnO(TMDSn), .TMDSp_clockO(TMDSp_clock), .TMDSn_clockO(TMDSn_clock));

	rectangle R1 (.i_animate(animate), .goAnimate(goAnimate), .o_x1(o_x1), .o_x2(o_x2), .o_y1(o_y1), .o_y2(o_y2), .display(display));
	
///////////////////////////////////////////////////////////////////////////////
	//display segment
	//reg [3:0] pixRd;
	wire pixRd;
	reg [1:0] pixOf;
	//set color
	assign pixRd = ((x>o_x1)&(y>o_y1)&(x<o_x2)&(y<o_y2)&display) ? 1 : 0;
	
	always @(posedge pixclk)
	begin


			//old methood
//		 if((x>507&&x<527)&&(y>315&&y<386))//bar 1
//			begin
//				pixRd <= 3;
//			end
//		else if((x>493&&x<506)&&(y>313&&y<385))//bar 2
//			begin
//				pixRd <= 3;
//			end
//		else
//			begin
//				pixRd <=0;
//			end
		//which color to assigh (works)
		if(DrawArea)
		begin
		case(pixRd)
			4'h0: begin red <= 0;green <= 0; blue<= 0; end				//black
			4'h1: begin red <= 219; green <=32; blue<= 62; end			//on red
			4'h2: begin red <= 77; green <= 25; blue<= 27; end			//off red
			4'h3: begin red <= 168; green <= 176; blue<= 67; end		//on green
			4'h4: begin red <= 43; green <= 51; blue<= 20; end			//off green
			4'h5: begin red <= 255; green <= 169; blue<= 0; end		//on orange
			4'h6: begin red <= 71; green <= 40; blue<= 18; end			//off orange
			4'h7: begin red <= 255; green <= 255; blue<= 255; end		//white
			default: begin red <= 127;green <= 127; blue<= 127; end	//grey
		endcase
		end
		else
		begin
			 red <= 0;
			 green <= 0;
			 blue<= 0;
		end
	end
	//assign led = ((x>o_x1)&(y>o_y1)&(x<o_x2)&(y<o_y2)) ? 255 : 0;
endmodule
