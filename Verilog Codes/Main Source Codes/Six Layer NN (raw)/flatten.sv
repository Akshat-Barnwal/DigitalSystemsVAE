module flatten #(parameter bits=18,size=784) (y,flattened_array_out,done);
input signed [bits-1:0] y [0:size-1];
output reg signed [bits*size-1:0] flattened_array_out;
input done;
integer i, j;
integer index = 0;

always @(posedge done) begin
    index = 0;
    if(done) begin
    flattened_array_out = 0;
    for (i = 0; i < size; i=i+1) begin
        for (j = 0; j < bits; j=j+1) begin
            flattened_array_out[index] = y[i][j];
            index = index + 1;
        end
    end
    end
end

endmodule