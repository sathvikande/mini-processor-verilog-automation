`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2025 07:59:01
// Design Name: 
// Module Name: decoder_2tot4
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


module decoder_2tot4(
input [1:0] sel,
output reg [3:0] led
    );
    always @(*) begin
    case (sel)
        2'b00 : led = 4'b0001; // add
    2'b01 : led =4'b0010; //sub
    2'b10 : led =4'b0100; //and
    2'b11 : led= 4'b1000;//or
    
    default : led = 4'b0000;
    endcase 
    end 
endmodule
