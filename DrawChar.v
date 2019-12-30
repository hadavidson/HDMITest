module DrawChar(input pixclk, drCh, input [5:0] chr, input [9:0] CounterX, CounterY, output reg pix, charDone);	
	//load table
	reg [63:0] chrO;
	always @(posedge pixclk)
	begin
		if(chr == 'h1B)//zero
			chrO <= 64'b0111110011000110110011101101111011110110111001100111110000000000;
		else if(chr == 'h1C)
			chrO <= 64'b0011000001110000001100000011000000110000001100001111110000000000;
		else if(chr == 'h1D)
			chrO <= 64'b0111100011001100000011000011100001100000110011001111110000000000;
		else//blank
			chrO <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
	end
	
	//define pix
	reg [9:0] desX, desY;
	always @(posedge drCh)
	begin
		desX <= CounterX;
		desY <= CounterY;
	end
	
	//pixel and color
	always @(posedge pixclk)
	begin
		if(CounterY==desY)
		begin
			if(CounterX==desX)
				pix<=chrO[63];
			else if(CounterX==desX+1)
				pix<=chrO[62];
			else if(CounterX==desX+2)
				pix<=chrO[61];
			else if(CounterX==desX+3)
				pix<=chrO[60];
			else if(CounterX==desX+4)
				pix<=chrO[59];
			else if(CounterX==desX+5)
				pix<=chrO[58];
			else if(CounterX==desX+6)
				pix<=chrO[57];
			else if(CounterX==desX+7)
				pix<=chrO[56];
			else
				pix<='b0;
		end
		else if(CounterY==(desY+1))
		begin
			if(CounterX==desX)
				pix<=chrO[55];
			else if(CounterX==desX+1)
				pix<=chrO[54];
			else if(CounterX==desX+2)
				pix<=chrO[53];
			else if(CounterX==desX+3)
				pix<=chrO[52];
			else if(CounterX==desX+4)
				pix<=chrO[51];
			else if(CounterX==desX+5)
				pix<=chrO[50];
			else if(CounterX==desX+6)
				pix<=chrO[49];
			else if(CounterX==desX+7)
				pix<=chrO[48];
			else
				pix<='b0;
		end
		else if(CounterY==(desY+2))
		begin
			if(CounterX==desX)
				pix<=chrO[47];
			else if(CounterX==desX+1)
				pix<=chrO[46];
			else if(CounterX==desX+2)
				pix<=chrO[45];
			else if(CounterX==desX+3)
				pix<=chrO[44];
			else if(CounterX==desX+4)
				pix<=chrO[43];
			else if(CounterX==desX+5)
				pix<=chrO[42];
			else if(CounterX==desX+6)
				pix<=chrO[41];
			else if(CounterX==desX+7)
				pix<=chrO[40];
			else
				pix<='b0;
		end
		else if(CounterY==(desY+3))
		begin
			if(CounterX==desX)
				pix<=chrO[39];
			else if(CounterX==desX+1)
				pix<=chrO[38];
			else if(CounterX==desX+2)
				pix<=chrO[37];
			else if(CounterX==desX+3)
				pix<=chrO[36];
			else if(CounterX==desX+4)
				pix<=chrO[35];
			else if(CounterX==desX+5)
				pix<=chrO[34];
			else if(CounterX==desX+6)
				pix<=chrO[33];
			else if(CounterX==desX+7)
				pix<=chrO[32];
			else
				pix<='b0;
		end
		else if(CounterY==(desY+4))
		begin
			if(CounterX==desX)
				pix<=chrO[31];
			else if(CounterX==desX+1)
				pix<=chrO[30];
			else if(CounterX==desX+2)
				pix<=chrO[29];
			else if(CounterX==desX+3)
				pix<=chrO[28];
			else if(CounterX==desX+4)
				pix<=chrO[27];
			else if(CounterX==desX+5)
				pix<=chrO[26];
			else if(CounterX==desX+6)
				pix<=chrO[25];
			else if(CounterX==desX+7)
				pix<=chrO[24];
			else
				pix<='b0;
		end
		else if(CounterY==(desY+5))
		begin
			if(CounterX==desX)
				pix<=chrO[23];
			else if(CounterX==desX+1)
				pix<=chrO[22];
			else if(CounterX==desX+2)
				pix<=chrO[21];
			else if(CounterX==desX+3)
				pix<=chrO[20];
			else if(CounterX==desX+4)
				pix<=chrO[19];
			else if(CounterX==desX+5)
				pix<=chrO[18];
			else if(CounterX==desX+6)
				pix<=chrO[17];
			else if(CounterX==desX+7)
				pix<=chrO[16];
			else
				pix<='b0;
		end
		else if(CounterY==(desY+6))
		begin
			if(CounterX==desX)
				pix<=chrO[15];
			else if(CounterX==desX+1)
				pix<=chrO[14];
			else if(CounterX==desX+2)
				pix<=chrO[13];
			else if(CounterX==desX+3)
				pix<=chrO[12];
			else if(CounterX==desX+4)
				pix<=chrO[11];
			else if(CounterX==desX+5)
				pix<=chrO[10];
			else if(CounterX==desX+6)
				pix<=chrO[9];
			else if(CounterX==desX+7)
				pix<=chrO[8];
			else
				pix<='b0;
		end
		else if(CounterY==(desY+7))
		begin
			if(CounterX==desX)
				pix<=chrO[7];
			else if(CounterX==desX+1)
				pix<=chrO[6];
			else if(CounterX==desX+2)
				pix<=chrO[5];
			else if(CounterX==desX+3)
				pix<=chrO[4];
			else if(CounterX==desX+4)
				pix<=chrO[3];
			else if(CounterX==desX+5)
				pix<=chrO[2];
			else if(CounterX==desX+6)
				pix<=chrO[1];
			else if(CounterX==desX+7)
				pix<=chrO[0];
			else
			begin
				pix='b0;
				charDone <= 'b1;
			end
		end
		else
		begin
			pix <= 'b0;
			charDone <= 'b0;
		end
	end
endmodule
