`timescale 1ns/1ns
`include "flipflop.v"
module testbench; 

reg D = 0 ,CLK = 0;
wire Q;

flipflop uut(D,CLK,Q);

always begin 
   CLK = ~CLK;
   #10;
 end

 initial begin
    $dumpfile("flipflop.vcd");
    $dumpvars
    (0, testbench);
    D=0; #45;
    D = 1; #40;
    D = 0; #40;
    $finish;
 end
    
endmodule