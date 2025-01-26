`timescale 1ns / 1ps

module Mux4to1_tb;
    reg [3:0] in;    
    reg [1:0] sel;   
    wire y;         
    
    Mux4to1 uut (
        .in(in),
        .sel(sel),
        .y(y)
    );

    initial begin
        $dumpfile("Mux4to1_tb.vcd");
        $dumpvars(0, Mux4to1_tb);

        // Test cases
        in = 4'b1010; sel = 2'b00; #10; 
        in = 4'b1010; sel = 2'b01; #10; 
        in = 4'b1010; sel = 2'b10; #10; 
        in = 4'b1010; sel = 2'b11; #10; 

        $finish;
    end
endmodule
