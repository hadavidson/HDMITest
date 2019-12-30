module HDMI_test(input clk, output [2:0] TMDSp, TMDSn, output TMDSp_clock, TMDSn_clock, output [7:0] led, input [3:0] dip);//, output mem_clk, mem_cs_n, mem_cke, mem_ras_n, mem_cas_n, mem_we_n, output [1:0] mem_ba, mem_DQM, output [12:0] mem_addr, inout [15:0] mem_dq);

///////////////////////////////////////////////////////////////////////////////
	//create variables
	
	//pic variables
	reg [7:0] red, green, blue;
	wire [11:0] x, y;
	wire pixclk, clk_TMDS, hSync, vSync, DrawArea, animate;
		 
//	 //sdram variables
//	 //write
//	 reg [23:0] wrAddr;
//	 wire [15:0] wrData;
//	 wire wrEnable;
//	 //read
//	 reg [23:0] reAddr;
//	 wire [15:0] rdData;
//	 wire rdReady, rdEnable;
//	 //controal
//	 wire busy, rst;
//	 reg sdRe;
	 
	 //assign and inital variables
//	 assign rst = 1;
//	 initial sdRe = 0;

///////////////////////////////////////////////////////////////////////////////
	//call modules
	
	//create clocks
	pixelClk pxlc(.inclk0(clk),.c0(pixclk),.c1(clk_TMDS));
	sdramPll sdrc(.inclk0(clk),.c0(mem_clk));
	
	//create HDMI sync points
	HvSync HVS1 (.pixclk(pixclk), .CounterX(x), .CounterY(y), .hSync(hSync), .vSync(vSync), .DrawArea(DrawArea), .animate(animate));
	
	//genarate HDMI output
	CreateHDMIOutputs CHIO1 (.pixclkI(pixclk), .clk_TMDSI(clk_TMDS), .hSyncI(hSync), .vSyncI(vSync), .DrawAreaI(DrawArea), .redI(red), .greenI(green), .blueI(blue), .TMDSpO(TMDSp), .TMDSnO(TMDSn), .TMDSp_clockO(TMDSp_clock), .TMDSn_clockO(TMDSn_clock));
	 
	//sdram controller
//	sdram_controller sdram_controlleri (.wr_addr(wrAddr), .wr_data(wrData), .wr_enable(wrEnable), .rd_addr(reAddr), .rd_data(rdData), .rd_ready(rdReady), .rd_enable(rdEnable), .busy(busy), .rst_n(rst), .clk(mem_clk), .addr(mem_addr), .bank_addr(mem_ba), .data(mem_dq), .clock_enable(mem_cke), .cs_n(mem_cs_n), .ras_n(mem_ras_n), .cas_n(mem_cas_n), .we_n(mem_we_n), .data_mask_low (mem_DQM[0]), .data_mask_high(mem_DQM[1]));
	
	//reset ram read wite
//	assign rdEnable = (sdRe & (!wrEnable)) ? 1'b1 : 1'b0;
	
	//load data to ram
//	loadRam LR1 (.mem_clk(mem_clk), .animate(animate), .wrAddr(wrAddr), .wrData(wrData), .wrEnable(wrEnable));
	
///////////////////////////////////////////////////////////////////////////////
	//display segment
	reg [1:0] pix;
	reg [3:0] pixRd;
//	initial reAddr = 24'h000000;
	
	//set color
	always @(posedge pixclk)
	begin
		//switch betwen read and write
//		if(!busy)
//			sdRe <= 1;
//		else
//			sdRe <= 0;
		//which pixel to look at (works)
//		case(pix)
//			2'h0: pixRd <= rdData[3:0];
//			2'h1: pixRd <= rdData[7:4];
//			2'h2: pixRd <= rdData[11:8];
//			2'h3: pixRd <= rdData[15:12];
//		endcase
		if(x>10&&x<100)
			begin
				pixRd <= 1;
			end
		else
			begin
				pixRd <=0;
			end
		
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
//		pix <= pix + 1;

		
//		if(pix==2'b11)
//			if(animate)
//			begin
//				reAddr <= 24'd0;
//				pix <= 0;
//			end
//			else
//				if(DrawArea)
//					reAddr = reAddr + 1;
//				else
//					reAddr = reAddr;
//		else
//		reAddr <= x*y;
//		wrAddr <= (x*y)*2;
//		if(DrawArea)
//		begin
//			reAddr <= x*y;
////			wrAddr <= x*y;
//		end
//		else
//		begin
//			reAddr <= 0;
////			wrAddr <= 24'hFFFFFF;
//		end
	end
//	assign led = reAddr[22:15];
endmodule
