module loadRam(input mem_clk, animate, input [23:0] wrAddr, output reg [15:0] wrData, output wire wrEnable);
	
//	reg [5:0] loop;
//	reg [3:0] pixO;
	
	always @(posedge mem_clk)
	begin
			wrData <= 16'h1111;
//			casez (wrAddr)
//				default: wrData <= 16'h0000;
//			endcase
	end
	
endmodule
