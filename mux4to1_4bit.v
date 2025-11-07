`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2025 07:50:08
// Design Name: 
// Module Name: mux4to1_4bit
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


module mux4to1_4bit(
input [3:0] in0,in1,in2,in3,
input [1:0] sel,
output reg [3:0] out
    );
    
    always @(*) begin
    case(sel)
    2'b00 : out = in0; // add
    2'b01 : out = in1; //sub
    2'b10 : out = in2; //and
    2'b11 : out= in3;//or
    
    default : out = 4'b0000;
    endcase 
    end 
endmodule
