`timescale 1s/1ps
module NN(clk,reset,x,TxD,done);
input clk,reset;
output done;
input signed [3:0]x[0:1]; //17:0
wire signed [17:0]fin[0:1];
assign fin[0][12:0] = 13'b0000000000000;
assign fin[0][17:13] = x[0];
assign fin[1][12:0] = 13'b0000000000000;
assign fin[1][17:13] = x[1];
wire signed [17:0]y[0:783];
wire done5,done6;
wire signed [17:0]y5[0:19];
wire reset_of_transmitter;
output TxD;
wire signed [7:0]o;
wire transmitted ;
layer5 L5(clk,reset,fin,y5,done5);
layer6 L6(clk,~done5,y5,y,done);
wire [14111:0]yf;
flatten f1(.y(y), .flattened_array_out(yf), .done(clk));
transform(.clk(transmitted), .x(yf), .o(o), .done(clk));
transmitter(.clk(~clk), .reset(~done), .transmit(done), .data(o), .TxD(TxD), .transmitted(transmitted));
endmodule