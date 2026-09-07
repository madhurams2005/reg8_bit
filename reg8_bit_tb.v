`timescale 1ns/1ps

module reg8bit_tb;

reg clk;
reg reset;
reg enable;
reg [7:0] data_in;
wire [7:0] data_out;

register8bit uut (
    .clk(clk),
    .reset(reset),
    .en(enable),
    .d(data_in),
    .q(data_out)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    enable = 0;
    data_in = 8'b00000000;

    #10;
    reset = 0;

    #10;
    enable = 1;
    data_in = 8'b10101010;

    #10;
    data_in = 8'b11001100;

    #10;
    enable = 0;
    data_in = 8'b11111111;

    #20;
    $stop;
end

endmodule