`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2025 07:07:35
// Design Name: 
// Module Name: mini_processor
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


module mini_processor(
input [3:0] A,B,
input [1:0] ctrl, //control signal : selects operation
output [3:0] result,
output [3:0] LED
);

wire [1:0] op_code;
wire [3:0] add_res,sub_res;
wire [3:0] and_res,or_res;

//encoder : converts input in to op_code
encoder_2to2 ENC(.ctrl(ctrl),.op_code(op_code));


// Arithmetic Modules
adder_4bit ADD (.A(A), .B(B) ,.SUM(add_res));
subtractor_4bit SUB(.A(A) , .B(B) ,.DIFF(sub_res));

//logic operations 
assign and_res= A & B;
assign or_res = A | B; 

//multiplexer : selects input based on operation
mux4to1_4bit MUX (

.sel(op_code),
.in0(add_res),
.in1(sub_res),
.in2(and_res),
.in3(or_res),
.out(result)

);

//DECODER  : indicates active operation

decoder_2tot4 DEC (.sel(op_code),.led(LED));

endmodule
