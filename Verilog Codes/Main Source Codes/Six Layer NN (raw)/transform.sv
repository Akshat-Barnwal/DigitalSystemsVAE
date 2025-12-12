`timescale 1ns / 1ps
//[17:0]y[0:783] -> [7:0]y[0:1763]
module transform #(parameter bits=18, size=784) (
    input clk,
    input signed [bits*size-1:0] x,
    //input signed [17:0] y [0:783],
    output reg signed [7:0]o,
    input done
    );
//wire [14111:0]x;
//flatten f1(.y(y), .flattened_array_out(x), .done(done));
integer index;

always @(posedge clk) begin
    if (done) begin
        if(index+7<size*bits) begin
        o[0] = x[index];
        o[1] = x[index + 1];
        o[2] = x[index + 2];
        o[3] = x[index + 3];
        o[4] = x[index + 4];
        o[5] = x[index + 5];
        o[6] = x[index + 6];
        o[7] = x[index + 7];
        index = index + 8;
        end
    end
    else begin
        index = 0;
        o =  0;
    end
end
            
    //module transmitter(
    //input clk, //UART input clock
//input reset, // reset signal
//input transmit, //btn signal to trigger the UART communication
//input [7:0] data, // data transmitted
//output reg TxD // Transmitter serial output. TxD will be held high during reset, or when no transmissions aretaking place. 
//    );

        
endmodule
