module SigMoid_t();
reg signed [7:0]x[0:2] = {0,0,0}; //a vector
wire signed [4:0]y[0:2]; //output
reg clk,reset,done; //controls
SigMoid #(8,5,1,3) uut(clk,reset,x,y,done);
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

module layer_S_t();
reg signed [7:0]x[0:2] = {1,1,1}; //input
reg signed [7:0]M[0:8] = //weights
{
1,-1,0,
1,1,0,
0,0,1
};
reg signed [7:0]b[0:2] = {0,0,-5}; //bias
wire signed [7:0]y[0:2]; //output
reg clk,reset,done; //controls
layer_S #(8,8,0,3,3) uut(clk,reset,x,M,b,y,done);
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


module flatten_t();
reg signed [7:0]x[0:2] = {1,1,1}; //input
wire signed [23:0]y; //output
reg doIt; //controls
flatten #(8,3) uut(x,y,doIt);
initial begin
	doIt=0;
	#5;
	doIt=1;
	#100;
	$finish;
end
endmodule

module transform_t();
reg signed [15:0]x = 16; //input
wire signed [7:0]y; //output
reg doIt; //controls
reg clk;
initial begin 
    clk = 0;
	forever #1 clk = ~clk;
end
transform #(8,2) uut(clk,x,y,doIt);
initial begin
	doIt=0;
	#5;
	doIt=1;
	#30;
	$finish;
end
endmodule