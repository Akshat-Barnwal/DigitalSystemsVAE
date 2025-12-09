`timescale 1s/1ps
module NN(clk,reset,x,done, o1, o2);
input clk,reset;
output done;
output [3:0]o1;
output [3:0]o2;
input signed [3:0]x[0:1]; //17:0
wire signed [17:0]fin[0:1];
assign fin[0][17:4] = 13'b0000000000000;
assign fin[0][3:0] = x[0];
assign fin[1][17:4] = 13'b0000000000000;
assign fin[1][3:0] = x[1];
wire signed [17:0]y[0:783];
wire done5,done6;
wire signed [17:0]y5[0:19];
layer5 L5(clk,reset,fin,y5,done5);
layer6 L6(clk,~done5,y5,y,done);
assign o1 = y[225][3:0];
assign o2 = y[325][3:0];
endmodule