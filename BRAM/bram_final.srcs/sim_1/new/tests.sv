`timescale 1ns/1ps
module matrix_t();
reg signed [1:0]x[0:1] = {1,0}; //a vector
wire signed [3:0]y[0:1]; //output
reg clk,reset,done; //controls
wire [3:0]bj;
wire [1:0]w;
wire [6:0]addrM;
wire [6:0]addrb;
matrix #(2,4,2,2) uut(clk,reset,x,y,done,w,bj,addrM,addrb);
initial begin 
    clk = 0;
	forever #1 clk = ~clk;
end
initial begin
	reset=1;
	#5;
	reset=0;
	#50;
	$finish;
end
endmodule

module ReLu_t();
reg signed [7:0]x[0:2] = {12,-100,21}; //a vector
wire signed [4:0]y[0:2]; //output
reg clk,reset,done; //controls
ReLu #(8,5,1,3) uut(clk,reset,x,y,done);
initial begin 
    clk = 0;
	forever #1 clk = ~clk;
end
initial begin
	reset=1;
	#5;
	reset=0;
	#10;
	$finish;
end
endmodule

module layer_t();
reg signed [2:0] x[0:1] = {0,1};
reg signed [2:0] M[0:3] = {3,1,1,-2};
reg signed [5:0] b[0:1] = {-1,1};
wire signed [2:0] y[0:1];
reg clk,reset,done; //controls
layer #(3,6,0,2,2) uut(clk,reset,x,M,b,y,done);
initial begin 
    clk = 0;
	forever #1 clk = ~clk;
end
initial begin
	reset=1;
	#5;
	reset=0;
	#100;
	$finish;
end
endmodule