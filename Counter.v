`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2023 20:38:45
// Design Name: 
// Module Name: Counter
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


module Counter(input clk, rst,
    output reg counter_out);
    reg [15:0]counter;
    initial begin
        counter = 0;
        counter_out = 0;
    end
    always@(posedge clk)
    begin
        if(rst == 1'b0) begin
            counter = (counter == 20)? 1:(counter + 1);
            counter_out = (counter == 20)? ~counter_out:counter_out;
        end
        else begin
            counter = 0;
            counter_out = 0;
        end
    end
endmodule