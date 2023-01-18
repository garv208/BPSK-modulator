`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.01.2023 16:18:07
// Design Name: 
// Module Name: BPSK_modulator
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


module BPSK_modulator(input clk, rst, ld,
    input[15:0]data,
    output [15:0]bpsk);

    wire clk_2;
    reg d_bit;
    reg [15:0]Data;
    integer i;
    initial begin
        i = 0;
        //d_bit = 0;
    end
    Counter count(.clk(clk), .rst(rst), .counter_out(clk_2));
    SINE sine(.clk(clk), .data(d_bit), .sinus(bpsk));

    always@(ld) begin
        if(ld == 1) begin
            Data = data;
        end
    end

    always@(posedge clk_2)
    begin
        d_bit = Data[i];
        i = i+1;
        if(i == 15) begin
            i = 0;
        end
    end
endmodule
