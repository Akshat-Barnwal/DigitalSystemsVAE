`timescale 1s/1ps
module layer5(clk,reset,x,y,done);
input clk,reset;
output done;
input signed [3:0]x[0:1];
output signed [3:0]y[0:3];
localparam signed [3:0]W[0:7] = {
2, -1, 7, 3, 5, 5,  2,  0
};
localparam signed [16:0]b[0:3] = {
9, 4, 3, 0};
layer #(4, 17, 1, 2, 4) L5(clk,reset,x,W,b,y,done);
endmodule