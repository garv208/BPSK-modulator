module SINE(
    input clk , data,
    output reg [15:0] sinus
);
    parameter SIZE = 20;
    reg [15:0] rom_memory [SIZE-1:0];
    integer i;
    integer p;
    initial begin
        $readmemh("sine.mem", rom_memory); //File with the signal
        i = 0;
        p = 9;
    end
    //At every positive edge of the clock, output a sine wave sample.
    always@(posedge clk)
    begin
        sinus = data?rom_memory[p]:rom_memory[i];
        i = i + 1;
        p = p + 1;
        if(i == SIZE)begin
            i = 0;
        end
        else if (p == SIZE) begin
            p = 0;
        end
    end
endmodule
