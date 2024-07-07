`timescale 1ns / 1ps


module digital_safe_logic_tb();
reg clock;
reg [3:0]combination;
wire [6:0]display;

Digital_Safe_logic DUT(.clock(clock),.combination(combination),.display(display));

initial
begin
    clock = 1'b0;
end

always
begin
    #2 clock <= ~clock; 
end

initial 
begin
    combination = 4'b0111;
    #2 combination = 4'b0101;
    #2 combination = 4'b1011;
    #2 combination = 4'b1010;
end

endmodule
