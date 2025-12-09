module ReLu #(parameter inbits=8,outbits = 8,shift=0,size=10)(clk,reset,x,y,done);
input signed [inbits-1:0]x[0:size-1];
output reg signed [outbits-1:0]y[0:size-1];
input clk,reset;
output reg done;
integer i;
always @(posedge clk) begin
    if(reset) begin
        i=0;
        done=0;
    end else begin
        if(!done) begin
            if(x[i]<0) begin
                y[i]=0;
            end else begin
                y[i]=x[i][outbits+shift-1:shift];
            end
            i = i+1;
            if(i>size-1)
                done=1;
            else
                done=0;
        end 
    end
end
endmodule

module SigMoid #(parameter inbits=8,outbits = 8,shift=0,size=10)(clk,reset,x,y,done);
input signed [inbits-1:0]x[0:size-1];
output reg signed [outbits-1:0]y[0:size-1];
input clk,reset;
output reg done;
integer i;
always @(posedge clk) begin
    if(reset) begin
        i=0;
        done=0;
    end else if (x[i] > 6) begin
        if (!done) begin
            y[i] = 1;
        end
    end else if (x[i] < -6) begin
        if (!done) begin
            y[i] = 1;
        end
    end else begin
        if(!done) begin
            y[i]=(1<<<(shift-1)) + (x[i]/4) - ((((x[i]*x[i]*x[i])/48)>>>(2*shift))) ;
            y[i] = y[i] + (((x[i]*x[i]*x[i]*x[i]*x[i])/480)>>>(4*shift)) ;
            i = i+1;
            if(i>size-1)
                done=1;
            else
                done=0;
        end 
    end
end
endmodule

module I #(parameter inbits=8,outbits = 8,shift=0,size=10)(clk,reset,x,y,done);
input signed [inbits-1:0]x[0:size-1];
output reg signed [outbits-1:0]y[0:size-1];
input clk,reset;
output reg done;
integer i;
always @(posedge clk) begin
    if(reset) begin
        i=0;
        done=0;
    end else begin
        if(!done) begin
            y[i]=x[i][outbits+shift-1:shift];
            i = i+1;
            if(i>size-1)
                done=1;
            else
                done=0;
        end 
    end
end
endmodule