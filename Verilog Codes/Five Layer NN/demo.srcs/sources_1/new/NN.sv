`timescale 1s/1ps
module NN(clk,reset,x,y,done);
input clk,reset;
output done;
input signed [3:0]x[0:1];
output signed [3:0]y[0:3];
layer5 L5(clk,reset,x,y,done);
endmodule