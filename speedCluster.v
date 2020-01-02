module speedCluster(input wire animate,input wire [11:0] x, y, output wire [3:0] pixRd);

	wire [11:0] sP5mx1, sP5mx2, sP5my1, sP5my2, sP7mx1, sP7my1, sP7mx2, sP7my2, sP10mx1, sP10my1, sP10mx2, sP10my2, sP13mx1, sP13mx2, sP13my1, sP13my2, sP15mx1, sP15my1, sP15mx2, sP15my2, sP17mx1, sP17my1, sP17mx2, sP17my2, sP20mx1, sP20mx2, sP20my1, sP20my2, sP23mx1, sP23my1, sP23mx2, sP23my2, sP25mx1, sP25my1, sP25mx2, sP25my2, sP27mx1, sP27mx2, sP27my1, sP27my2, sP30mx1, sP30my1, sP30mx2, sP30my2, sP33mx1, sP33my1, sP33mx2, sP33my2, sP35mx1, sP35mx2, sP35my1, sP35my2, sP37mx1, sP37my1, sP37mx2, sP37my2, sP40mx1, sP40my1, sP40mx2, sP40my2, sP43mx1, sP43mx2, sP43my1, sP43my2, sP45mx1, sP45my1, sP45mx2, sP45my2, sP47mx1, sP47my1, sP47mx2, sP47my2, sP50mx1, sP50mx2, sP50my1, sP50my2, sP53mx1, sP53my1, sP53mx2, sP53my2, sP55mx1, sP55my1, sP55mx2, sP55my2, sP57mx1, sP57mx2, sP57my1, sP57my2, sP70mx1, sP70my1, sP70mx2, sP70my2, sP73mx1, sP73my1, sP73mx2, sP73my2, sP75mx1, sP75mx2, sP75my1, sP75my2, sP77mx1, sP77my1, sP77mx2, sP77my2, sP80mx1, sP80my1, sP80mx2, sP80my2, sP83mx1, sP83mx2, sP83my1, sP83my2, sP85mx1, sP85my1, sP85mx2, sP85my2;
	wire display;
	reg goAnimate=1;

	rectangle #(.H_HIGHT(74), .H_WIDTH(16), .IX(515), .IY(351)) sP5mR (.i_animate(animate), .goAnimate(goAnimate), .o_x1(sP5mx1), .o_x2(sP5mx2), .o_y1(sP5my1), .o_y2(sP5my2));
	rectangle #(.H_HIGHT(74), .H_WIDTH(16), .IX(500), .IY(350)) sP7mR (.i_animate(animate), .goAnimate(goAnimate), .o_x1(sP7mx1), .o_x2(sP7mx2), .o_y1(sP7my1), .o_y2(sP7my2));
	rectangle #(.H_HIGHT(74), .H_WIDTH(16), .IX(485), .IY(349)) sP10mR (.i_animate(animate), .goAnimate(goAnimate), .o_x1(sP10mx1), .o_x2(sP10mx2), .o_y1(sP10my1), .o_y2(sP10my2));

	wire [3:0] sP5m, sP5mf, sP7m, sP7mf, sP10m, sP10mf, sP13m, sP13mf, sP15m, sP15mf, sP17m, sP17mf,sP20m, sP20mf, sP23m, sP23mf, sP25m, sP25mf, sP27m, sP27mf, sP30m, sP30mf, sP33m, sP33mf,sp35m, sP35mf, sP37m, sP37mf, sP40m, sP40mf, sP43m, sP43mf, sP45m, sP45mf, sP47m, sP47mf,sP50m, sP50mf, sP53m, sP53mf, sP55m, sP55mf, sP57m, sP57mf, sP60m, sP60mf, sP63m, sP63mf,sP65m, sP65mf, sP67m, sP67mf, sP70m, sP70mf, sP73m, sP73mf, sP75m, sP75mf, sP77m, sP77mf,sP80m, sP80mf, sP83m, sP83mf, sP85m, sP85mf;

	//set color
	//5mph dash
	assign sP5m = ((x>sP5mx1)&(y>sP5my1)&(x<sP5mx2)&(y<sP5my2)) ? 'h4 : 0;
	assign sP5mf = ((x>sP5mx1+3)&(y>sP5my1+3)&(x<sP5mx2-3)&(y<sP5my2-3)) ? 'h1 : 0;
	//7mph dash
	assign sP7m = ((x>sP7mx1)&(y>sP7my1)&(x<sP7mx2)&(y<sP7my2)) ? 'h4 : 0;
	assign sP7mf = ((x>sP7mx1+3)&(y>sP7my1+3)&(x<sP7mx2-3)&(y<sP7my2-3)) ? 'h1 : 0;
	//10mph dash
	assign sP10m = ((x>sP10mx1)&(y>sP10my1)&(x<sP10mx2)&(y<sP10my2)) ? 'h4 : 0;
	assign sP10mf = ((x>sP10mx1+3)&(y>sP10my1+3)&(x<sP10mx2-3)&(y<sP10my2-3)) ? 'h1 : 0;
	//13mph dash
	assign sP13m = ((x>sP13mx1)&(y>sP13my1)&(x<sP13mx2)&(y<sP13my2)) ? 'h4 : 0;
	assign sP13mf = ((x>sP13mx1+3)&(y>sP13my1+3)&(x<sP13mx2-3)&(y<sP13my2-3)) ? 'h1 : 0;
	//15mph dash
	assign sP15m = ((x>sP15mx1)&(y>sP15my1)&(x<sP15mx2)&(y<sP15my2)) ? 'h4 : 0;
	assign sP15mf = ((x>sP15mx1+3)&(y>sP15my1+3)&(x<sP15mx2-3)&(y<sP15my2-3)) ? 'h1 : 0;
	//17mph dash
	assign sP17m = ((x>sP17mx1)&(y>sP17my1)&(x<sP17mx2)&(y<sP17my2)) ? 'h4 : 0;
	assign sP17mf = ((x>sP17mx1+3)&(y>sP17my1+3)&(x<sP17mx2-3)&(y<sP17my2-3)) ? 'h1 : 0;
	//20mph dash
	assign sP20m = ((x>sP20mx1)&(y>sP20my1)&(x<sP20mx2)&(y<sP20my2)) ? 'h4 : 0;
	assign sP20mf = ((x>sP20mx1+3)&(y>sP20my1+3)&(x<sP20mx2-3)&(y<sP20my2-3)) ? 'h1 : 0;
	//23mph dash
	assign sP23m = ((x>sP23mx1)&(y>sP23my1)&(x<sP23mx2)&(y<sP23my2)) ? 'h4 : 0;
	assign sP23mf = ((x>sP23mx1+3)&(y>sP23my1+3)&(x<sP23mx2-3)&(y<sP23my2-3)) ? 'h1 : 0;
	//25mph dash
	assign sP25m = ((x>sP25mx1)&(y>sP25my1)&(x<sP25mx2)&(y<sP25my2)) ? 'h4 : 0;
	assign sP25mf = ((x>sP25mx1+3)&(y>sP25my1+3)&(x<sP25mx2-3)&(y<sP25my2-3)) ? 'h1 : 0;
	//27mph dash
	assign sP27m = ((x>sP27mx1)&(y>sP27my1)&(x<sP27mx2)&(y<sP27my2)) ? 'h4 : 0;
	assign sP27mf = ((x>sP27mx1+3)&(y>sP27my1+3)&(x<sP27mx2-3)&(y<sP27my2-3)) ? 'h1 : 0;
	//30mph dash
	assign sP30m = ((x>sP30mx1)&(y>sP30my1)&(x<sP30mx2)&(y<sP30my2)) ? 'h4 : 0;
	assign sP30mf = ((x>sP30mx1+3)&(y>sP30my1+3)&(x<sP30mx2-3)&(y<sP30my2-3)) ? 'h1 : 0;
	//33mph dash
	assign sP33m = ((x>sP33mx1)&(y>sP33my1)&(x<sP33mx2)&(y<sP33my2)) ? 'h4 : 0;
	assign sp33mf = ((x>s33mx1+3)&(y>sP33my1+3)&(x<sP33mx2-3)&(y<sP33my2-3)) ? 'h1 : 0;
	//35mph dash
	assign sP35m = ((x>sP35mx1)&(y>sP35my1)&(x<sP35mx2)&(y<sP35my2)) ? 'h4 : 0;
	assign sP35mf = ((x>sP35mx1+3)&(y>sP35my1+3)&(x<sP35mx2-3)&(y<sP35my2-3)) ? 'h1 : 0;
	//37mph dash
	assign sP37m = ((x>sP37mx1)&(y>sP37my1)&(x<sP37mx2)&(y<sP37my2)) ? 'h4 : 0;
	assign sP37mf = ((x>sP37mx1+3)&(y>sP37my1+3)&(x<sP37mx2-3)&(y<sP37my2-3)) ? 'h1 : 0;
	//40mph dash
	assign sP40m = ((x>sP40mx1)&(y>sP40my1)&(x<sP40mx2)&(y<sP40my2)) ? 'h4 : 0;
	assign sP40mf = ((x>sP40mx1+3)&(y>sP40my1+3)&(x<sP40mx2-3)&(y<sP40my2-3)) ? 'h1 : 0;
	//43mph dash
	assign sP43m = ((x>sP43mx1)&(y>sP43my1)&(x<sP43mx2)&(y<sP43my2)) ? 'h4 : 0;
	assign sP43mf = ((x>sP43mx1+3)&(y>sP43my1+3)&(x<sP43mx2-3)&(y<sP43my2-3)) ? 'h1 : 0;
	//45mph dash
	assign sP45m = ((x>sP45mx1)&(y>sP45my1)&(x<sP45mx2)&(y<sP45my2)) ? 'h4 : 0;
	assign sP45mf = ((x>sP45mx1+3)&(y>sP45my1+3)&(x<sP45mx2-3)&(y<sP45my2-3)) ? 'h1 : 0;
	//47mph dash
	assign sP47m = ((x>sP47mx1)&(y>sP47my1)&(x<sP47mx2)&(y<sP47my2)) ? 'h4 : 0;
	assign sP47mf = ((x>sP47mx1+3)&(y>sP47my1+3)&(x<sP47mx2-3)&(y<sP47my2-3)) ? 'h1 : 0;
	//50mph dash
	assign sP50m = ((x>sP50mx1)&(y>sP50my1)&(x<sP50mx2)&(y<sP50my2)) ? 'h4 : 0;
	assign sP50mf = ((x>sP50mx1+3)&(y>sP50my1+3)&(x<sP50mx2-3)&(y<sP50my2-3)) ? 'h1 : 0;
	//53mph dash
	assign sP53m = ((x>sP53mx1)&(y>sP53my1)&(x<sP53mx2)&(y<sP53my2)) ? 'h4 : 0;
	assign sP53mf = ((x>sP53mx1+3)&(y>sP53my1+3)&(x<sP53mx2-3)&(y<sP53my2-3)) ? 'h1 : 0;
	//55mph dash
	assign sP55m = ((x>sP55mx1)&(y>sP55my1)&(x<sP55mx2)&(y<sP55my2)) ? 'h4 : 0;
	assign sP55mf = ((x>sP55mx1+3)&(y>sP55my1+3)&(x<sP55mx2-3)&(y<sP55my2-3)) ? 'h1 : 0;
	//57mph dash
	assign sP57m = ((x>sP57mx1)&(y>sP57my1)&(x<sP57mx2)&(y<sP57my2)) ? 'h4 : 0;
	assign sP57mf = ((x>sP57mx1+3)&(y>sP57my1+3)&(x<sP57mx2-3)&(y<sP57my2-3)) ? 'h1 : 0;
	//60mph dash
	assign sP60m = ((x>sP60mx1)&(y>sP60my1)&(x<sP60mx2)&(y<sP60my2)) ? 'h4 : 0;
	assign sP60mf = ((x>sP60mx1+3)&(y>sP60my1+3)&(x<sP60mx2-3)&(y<sP60my2-3)) ? 'h1 : 0;
	//63mph dash
	assign sP63m = ((x>sP63mx1)&(y>sP63my1)&(x<sP63mx2)&(y<sP63my2)) ? 'h4 : 0;
	assign sP63mf = ((x>sP63mx1+3)&(y>sP63my1+3)&(x<sP63mx2-3)&(y<sP63my2-3)) ? 'h1 : 0;
	//65mph dash
	assign sP65m = ((x>sP10mx1)&(y>sP10my1)&(x<sP10mx2)&(y<sP10my2)) ? 'h4 : 0;
	assign sP65mf = ((x>sP10mx1+3)&(y>sP10my1+3)&(x<sP10mx2-3)&(y<sP10my2-3)) ? 'h1 : 0;
	//67mph dash
	assign sP67m = ((x>sP5mx1)&(y>sP5my1)&(x<sP5mx2)&(y<sP5my2)) ? 'h4 : 0;
	assign sP67mf = ((x>sP5mx1+3)&(y>sP5my1+3)&(x<sP5mx2-3)&(y<sP5my2-3)) ? 'h1 : 0;
	//70mph dash
	assign sP70m = ((x>sP7mx1)&(y>sP7my1)&(x<sP7mx2)&(y<sP7my2)) ? 'h4 : 0;
	assign sP70mf = ((x>sP7mx1+3)&(y>sP7my1+3)&(x<sP7mx2-3)&(y<sP7my2-3)) ? 'h1 : 0;
	//73mph dash
	assign sP73m = ((x>sP10mx1)&(y>sP10my1)&(x<sP10mx2)&(y<sP10my2)) ? 'h4 : 0;
	assign sP73mf = ((x>sP10mx1+3)&(y>sP10my1+3)&(x<sP10mx2-3)&(y<sP10my2-3)) ? 'h1 : 0;
	//75mph dash
	assign sP75m = ((x>sP5mx1)&(y>sP5my1)&(x<sP5mx2)&(y<sP5my2)) ? 'h4 : 0;
	assign sP75mf = ((x>sP5mx1+3)&(y>sP5my1+3)&(x<sP5mx2-3)&(y<sP5my2-3)) ? 'h1 : 0;
	//77mph dash
	assign sP77m = ((x>sP7mx1)&(y>sP7my1)&(x<sP7mx2)&(y<sP7my2)) ? 'h4 : 0;
	assign sP77mf = ((x>sP7mx1+3)&(y>sP7my1+3)&(x<sP7mx2-3)&(y<sP7my2-3)) ? 'h1 : 0;
	//80mph dash
	assign sP80m = ((x>sP10mx1)&(y>sP10my1)&(x<sP10mx2)&(y<sP10my2)) ? 'h4 : 0;
	assign sP80mf = ((x>sP10mx1+3)&(y>sP10my1+3)&(x<sP10mx2-3)&(y<sP10my2-3)) ? 'h1 : 0;
	//83mph dash
	assign sP83m = ((x>sP5mx1)&(y>sP5my1)&(x<sP5mx2)&(y<sP5my2)) ? 'h4 : 0;
	assign sP83mf = ((x>sP5mx1+3)&(y>sP5my1+3)&(x<sP5mx2-3)&(y<sP5my2-3)) ? 'h1 : 0;
	//85mph dash
	assign sP85m = ((x>sP7mx1)&(y>sP7my1)&(x<sP7mx2)&(y<sP7my2)) ? 'h4 : 0;
	assign sP85mf = ((x>sP7mx1+3)&(y>sP7my1+3)&(x<sP7mx2-3)&(y<sP7my2-3)) ? 'h1 : 0;

	//make output
	assign pixRd = ((sP5m-sP5mf)+(sP7m-sP7mf)+(sP10m-sP10mf)+(sP13m-sP13mf)+(sP15m-sP15mf)+(sP17m-sP17mf)+(sP20m-sP20mf)+(sP23m-sP23mf)+(sP25m-sP25mf)+(sP27m-sP27mf)+(sP30m-sP30mf)+(sP33m-sP33mf)+(sp35m-sP35mf)+(sP37m-sP37mf)+(sP40m-sP40mf)+(sP43m-sP43mf)+(sP45m-sP45mf)+(sP47m-sP47mf)+(sP50m-sP50mf)+(sP53m-sP53mf)+(sP55m-sP55mf)+(sP57m-sP57mf)+(sP60m-sP60mf)+(sP63m-sP63mf)+(sP65m-sP65mf)+(sP67m-sP67mf)+(sP70m-sP70mf)+(sP73m-sP73mf)+(sP75m-sP75mf)+(sP77m-sP77mf)+(sP80m-sP80mf)+(sP83m-sP83mf)+(sP85m-sP85mf));
endmodule
