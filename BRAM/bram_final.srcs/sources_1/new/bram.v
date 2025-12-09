`timescale 1ns / 1ps

module bram(
    input clka,
    input ena,
    input wea,
    input [2:0]addra,
    input [10:0]dina,
    output [15:0]douta,
    wire [4:0]init,
    wire [15:0]fin
    );
    
assign init[4] = 1'b0;
assign init[3] = 1'b0;
assign init[2] = 1'b0;
assign init[1] = 1'b0;
assign init[0] = 1'b0;

assign fin = {init, dina};
    
blk_mem_gen_0 u1(.clka(clka), .ena(ena), .wea(wea), .addra(addra), .dina(fin), .douta(douta));

endmodule

///    clka : IN STD_LOGIC;
///    ena : IN STD_LOGIC;
///    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
///    addra : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
///    dina : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
///    douta : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);