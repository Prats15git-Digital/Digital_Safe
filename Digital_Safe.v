`timescale 1ns / 1ps

module Digital_Safe_logic(
input clock,
input [3:0]combination,
output reg [6:0]display);

parameter password = 4'b1010;
reg [1:0]check;
reg display = 7'b1000111;

always@(posedge clock)
begin
    check[1] = ~(combination[0]^password[0]) & ~(combination[1]^password[1]) & ~(combination[2]^password[2])
    & ~(combination[3]^password[3]);
    check[0] = ~check[1];
    
    case(check)
        2'b01 : display = 7'b1000111; //L display means Locked
        2'b10 : display = 7'b1000001; //U display means Open
    endcase
end

endmodule
