`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2025 07:28:32
// Design Name: 
// Module Name: encoder_2to2
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


module encoder_2to2(
input [1:0] ctrl,
output [1:0] op_code
    );
    
    assign op_code = ctrl; //simpler pass through 
    
endmodule
