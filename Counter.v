`timescale 1ns / 1ps
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
