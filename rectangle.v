module rectangle #(
		H_HIGHT=160,    // rectangle height
		H_WIDTH=160,    // rectangle width
		IX=320,         // initial horizontal position of square centre
		IY=240,         // initial vertical position of square centre
		IX_DIR=1,       // initial horizontal direction: 1 is right, 0 is left
		IY_DIR=1,       // initial vertical direction: 1 is down, 0 is up
		D_WIDTH=640,    // width of display
		D_HEIGHT=480    // height of display
	)
	(
		input wire i_animate,     // animate when input is high
		input wire goAnimate,		// when to use animation
		output wire [11:0] o_x1,  // square left edge: 12-bit value: 0-4095
		output wire [11:0] o_x2,  // square right edge
		output wire [11:0] o_y1,  // square top edge
		output wire [11:0] o_y2  // square bottom edge
	);

	reg [11:0] x = IX;   // horizontal position of square centre
	reg [11:0] y = IY;   // vertical position of square centre
	reg x_dir = IX_DIR;  // horizontal animation direction
	reg y_dir = IY_DIR;  // vertical animation direction
	reg hightD, widthD;
	reg [8:0] hight = H_HIGHT;
	reg [8:0] width = H_WIDTH;

	assign o_x1 = x - (width/2);  // left
	assign o_x2 = x + (width/2);  // right
	assign o_y1 = y - (hight/2);  // top
	assign o_y2 = y + (hight/2);  // bottom

	always @(posedge i_animate && goAnimate)
	begin
		x <= (x_dir) ? x + 1 : x - 1;			//   move left if positive x_dir
		y <= (y_dir) ? y + 1 : y - 1;			//   move down if positive y_dir
//		hight <= (hightD) ? hight+1 : hight-1;
//		width <= (widthD) ? width+1 : width-1;
		if (x <= (width/2) + 1)					//   edge of square is at left of screen
		x_dir <= 1;								//   change direction to right
		if (x >= (D_WIDTH - (width/2) - 1))	//   edge of square at right
		x_dir <= 0;								//   change direction to left
		if (y <= (hight/2) + 1)					//   edge of square at top of screen
		y_dir <= 1;								//   change direction to down
		if (y >= (D_HEIGHT - (hight/2) - 1))//   edge of square at bottom
		y_dir <= 0;								//   change direction to up
//		if(hight>= H_HIGHT-50)
//		hightD <=0;
//		if(hight<= H_HIGHT+50)
//		hightD <=1;
//		if(width>= H_WIDTH+50)
//		widthD <=0;
//		if(width<= H_WIDTH-50)
//		widthD <=1;
	end
endmodule
