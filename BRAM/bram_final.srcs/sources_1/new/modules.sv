`timescale 1ns / 1ps

module matrix (clk,reset,x,y,done
//,row_done,product,acc
);
input clk;
input reset;
input signed [2:0] x[0:1];
//input signed [bits-1:0] M[0:row_size*column_size -1];
//input signed [outbits-1:0] b[0:column_size-1];
output reg signed [3:0] y[0:1];
output reg done;
reg [2:0]w;
reg [3:0]bj;
//output 
reg signed [3:0]acc;
//output 
reg signed [3:0]product;
integer addr_in = 0;
integer addr_out = 0;
//output 
reg row_done;
reg [2:0]addrM;
reg [2:0]addrb;
integer column_size = 2;
integer row_size = 2;
reg mod_clk;
blk_mem_gen_0 u1(.clka(mod_clk), .ena(~reset), .wea(0), .addra(addrM), .dina(0), .douta(w));
blk_mem_gen_1 u2(.clka(mod_clk), .ena(~reset), .wea(0), .addra(addrb), .dina(0), .douta(bj));

always @(posedge clk) begin
	if(reset) begin
		addr_in = 0;
		addr_out = 0;
		row_done = 0;
		done = 0;
		acc = 0;
		addrM = 0;
		addrb = 0;
		mod_clk = 0;
	end else if(!done) begin
	    mod_clk = ~mod_clk;
		if(row_done) begin
			if(addr_out < column_size) begin
				addr_in = 0;
				acc = 0;
				row_done =0;
				product = product;
				addrM = addr_out*row_size;
			end else begin
				done =1;
			end
		end else begin
			if(addr_in < row_size) begin
				product = x[addr_in]*w;
				acc = acc + product;
				addr_in = addr_in + 1;
                addrM = (addr_out*row_size)+addr_in;
			end else begin
				row_done =1;
				y[addr_out] = acc + bj;
				addr_out = addr_out + 1;
				addrb = addr_out;
				acc = acc;
			end
		end
	end
end

endmodule

//module mTb(clk,reset,x,y,done);
//input signed [2:0]x[0:1];
//output signed [3:0]y[0:1];
//input clk,reset;
//output done;
//matrix #(3,4,2,2) Mat (clk,reset,x,y,done);
//endmodule

//module ReLu #(parameter inbits=8,outbits = 8,shift=0,size=10)(clk,reset,x,y,done);
//input signed [inbits-1:0]x[0:size-1];
//output reg signed [outbits-1:0]y[0:size-1];
//input clk,reset;
//output reg done;
//integer i;
//always @(posedge clk) begin
//    if(reset) begin
//        i=0;
//        done=0;
//    end else begin
//        if(!done) begin
//            if(x[i]<0) begin
//                y[i]=0;
//            end else begin
//                y[i]=x[i][outbits+shift-1:shift];
//            end
//            i = i+1;
//            if(i>size-1)
//                done=1;
//            else
//                done=0;
//        end 
//    end
//end
//endmodule

//module layer #(parameter bits=8, max_bits=8, shift=0, row_size=10, column_size=10)(clk,reset,x,M,b,y,done);
//input clk;
//input reset;
//input signed [bits-1:0] x[0:row_size-1];
//input signed [bits-1:0] M[0:row_size*column_size -1];
//input signed [max_bits-1:0] b[0:column_size-1];
//wire signed [max_bits-1:0] Y[0:column_size-1];
//output signed [bits-1:0] y[0:column_size-1];
//output done;
//wire mul_done;
//matrix #(bits,max_bits,row_size,column_size) Mat(clk,reset,x,M,b,Y,mul_done);
//ReLu #(max_bits,bits,shift,column_size) R(clk,~mul_done,Y,y,done);
//endmodule

//module layerToburn(clk,reset,x,y,done);
//input clk;
//input reset;
//input signed [2:0] x[0:1];
//localparam signed [2:0] M[0:3] = {3,1,1,-2};
//localparam signed [5:0] b[0:1] = {-1,1};
//output signed [2:0] y[0:1];
//output done;
//layer #(3,6,0,2,2) L(clk,reset,x,M,b,y,done);
//endmodule