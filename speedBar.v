module speedBar(input wire animate, goAnimate, active, input wire [7:0] H_WIDTH, input wire [11:0] IX, IY, x, y, output wire [3:0] barOut);

	wire [11:0] mx1, mx2, my1, my2;
	wire [3:0] sPm, sPmf;

	rectangle #(.H_HIGHT(74), .H_WIDTH(H_WIDTH), .IX(515), .IY(351)) sP5mR (.i_animate(animate), .goAnimate(goAnimate), .o_x1(mx1), .o_x2(mx2), .o_y1(my1), .o_y2(my2));

	assign sPm = ((x>mx1)&(y>my1)&(x<mx2)&(y<my2)) ? 'h4 : 0;
	assign sPmf = ((x>mx1+3)&(y>my1+3)&(x<mx2-3)&(y<my2-3)) ? 'h1 : 0;
	
	assign barOut = (sPm-sPmf);
	
endmodule
