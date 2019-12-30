module HvSync(input pixclk, output reg [11:0] CounterX, CounterY, output reg hSync, vSync, DrawArea, animate);
		
	//main code
	always @(posedge pixclk) DrawArea <= (CounterX<640) && (CounterY<480);
	
	always @(posedge pixclk) animate <= (CounterX==640) && (CounterY==480);

	always @(posedge pixclk) CounterX <= (CounterX==799) ? 0 : CounterX+1;
	always @(posedge pixclk) if(CounterX==799) CounterY <= (CounterY==524) ? 0 : CounterY+1;

	always @(posedge pixclk) hSync <= (CounterX>=656) && (CounterX<752);
	always @(posedge pixclk) vSync <= (CounterY>=490) && (CounterY<492);
endmodule
