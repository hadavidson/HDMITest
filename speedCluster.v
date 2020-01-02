module speedCluster(input wire animate,input wire [11:0] x, y, output wire [3:0] pixRd);

	wire display;
	reg goAnimate=1;
		
//	rectangle #(.H_HIGHT(74), .H_WIDTH(16), .IX(515), .IY(351)) sP5mR (.i_animate(animate), .goAnimate(goAnimate), .o_x1(sP5mx1), .o_x2(sP5mx2), .o_y1(sP5my1), .o_y2(sP5my2));
//	rectangle #(.H_HIGHT(74), .H_WIDTH(16), .IX(500), .IY(350)) sP7mR (.i_animate(animate), .goAnimate(goAnimate), .o_x1(sP7mx1), .o_x2(sP7mx2), .o_y1(sP7my1), .o_y2(sP7my2));
//	rectangle #(.H_HIGHT(74), .H_WIDTH(16), .IX(485), .IY(349)) sP10mR (.i_animate(animate), .goAnimate(goAnimate), .o_x1(sP10mx1), .o_x2(sP10mx2), .o_y1(sP10my1), .o_y2(sP10my2));

	//outputs
	wire [3:0] sp5Mph, sp7Mph, sp10Mph;
	
	//create steps
	//5mph
	speedBar s5mph (.animate(animate), .goAnimate(goAnimate), .active(1), .H_WIDTH(16), .IX(515), .IY(351), .x(x), .y(y), .barOut(sp5Mph));
	//7mph
	speedBar s7mph (.animate(animate), .goAnimate(goAnimate), .active(1), .H_WIDTH(16), .IX(500), .IY(350), .x(x), .y(y), .barOut(sp7Mph));
	//10mph
	speedBar s10mph(.animate(animate), .goAnimate(goAnimate), .active(1), .H_WIDTH(16), .IX(485), .IY(349), .x(x), .y(y), .barOut(sp10Mph));

	//make output
	assign pixRd = (sp5Mph + sp7Mph + sp10Mph);
endmodule
