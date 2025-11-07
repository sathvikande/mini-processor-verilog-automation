`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Sathvik Ande
// Design: Mini Processor Testbench
//////////////////////////////////////////////////////////////////////////////////

module tb_mini_processor;
    reg [3:0] A, B;
    reg [1:0] ctrl;
    wire [3:0] LED, result;

    // Instantiate the DUT (Device Under Test)
    mini_processor uut (
        .A(A),
        .B(B),
        .ctrl(ctrl),
        .LED(LED),
        .result(result)   // 
    );

    initial begin 
        // Create waveform file
     $dumpfile("C:/Users/Ganga/mini_processer/mini_processer.srcs/sim_1/new/mini_processor.vcd");
        $dumpvars(0, tb_mini_processor);

        $display("A\tB\tctrl\tResult\tLED\toperation");

        // ADD
        A=4'b0101; B=4'b0011; ctrl=2'b00; #10;
        $display("%b\t%b\t%02b\t%b\t%b\tADD", A, B, ctrl, result, LED);

        // SUB
        A=4'b0101; B=4'b0001; ctrl=2'b01; #10;
        $display("%b\t%b\t%02b\t%b\t%b\tSUB", A, B, ctrl, result, LED);

        // AND
        A=4'b1010; B=4'b1100; ctrl=2'b10; #10;
        $display("%b\t%b\t%02b\t%b\t%b\tAND", A, B, ctrl, result, LED);

        // OR
        A=4'b1010; B=4'b1100; ctrl=2'b11; #10;
        $display("%b\t%b\t%02b\t%b\t%b\tOR", A, B, ctrl, result, LED);

        $display("Simulation complete ");
        $finish;
    end
endmodule
