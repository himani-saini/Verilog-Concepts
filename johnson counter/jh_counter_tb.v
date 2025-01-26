`timescale 1ns / 1ps
include "jh_counter.v"

module jh_counter_tb;
    reg clk;          
    reg reset;        
    wire [3:0] q;     

   
    jh_counter uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end


    initial begin
        $dumpfile("jh_counter.vcd");
        $dumpvars(0, jh_counter_tb);

        reset = 1; 
        #10 reset = 0; 

        
        #100;

        $finish; 
    end
endmodule
