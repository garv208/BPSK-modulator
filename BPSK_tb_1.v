`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.01.2023 16:55:13
// Design Name: 
// Module Name: BPSK_tb_1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BPSK_tb_1;

    // Inputs
    reg clk;
    reg rst;
    reg ld;
    reg [15:0] data;

    // Outputs
    wire [15:0] mod_sig;

    // Instantiate the Unit Under Test (UUT)
    BPSK_modulator uut (
        .clk(clk),
        .rst(rst),
        .ld(ld),
        .data(data),
        .bpsk(mod_sig)
    );


    initial begin
    // Initialize Inputs
        clk = 0;
        rst = 1;
        ld = 0;
        data = 0;
    end

    initial begin
        #1 data = 16'b1010101010101010;
        #1 ld = 1;
        #1 ld = 0;
        rst = 0;
    end

    always begin
        #0.5 clk = ~clk;
    end

    initial begin
        #2000 $finish;
    end
endmodule


