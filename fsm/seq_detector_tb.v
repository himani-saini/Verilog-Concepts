`timescale 1ns / 1ps
`include "seq_detector.v"

module testbench;
    reg x, clk, reset;
    wire y;

    // Instantiate the DUT (Device Under Test)
    seq_detector uut (x, clk, reset, y);

    // Clock generation
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        $dumpfile("seq_detector.vcd");
        $dumpvars(0, testbench);

        // Initialize inputs
        x = 1'b0; reset = 1'b1;
        #15 reset = 1'b0;

        // Apply test sequence
        #12 x = 0; #10 x = 0; #10 x = 1; #10 x = 1;
        #10 x = 0; #10 x = 1; #10 x = 1; #10 x = 0;
        #10 x = 0; #10 x = 1; #10 x = 1; #10 x = 0;

        #10 $finish;
    end
endmodule
