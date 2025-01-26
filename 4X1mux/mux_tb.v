`timescale 1ns / 1ps
`include "mux.v"

module mux_tb;
    reg [3:0] in;    
    reg [1:0] sel;   
    wire y;         
    
    mux uut (in,sel,y);

    initial begin
        $dumpfile("mux.vcd");
        $dumpvars(0, mux_tb);

        in = 4'b1010; sel = 2'b00; #5; 
        in = 4'b1010; sel = 2'b01; #5; 
        in = 4'b1010; sel = 2'b10; #5; 
        in = 4'b1010; sel = 2'b11; #5; 

        $finish;
    end
endmodule
