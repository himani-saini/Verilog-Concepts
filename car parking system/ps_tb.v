`timescale 1ns / 1ps
`include "parking_system.v"

module ps_tb;

  // Inputs
  reg clk;
  reg reset_n;
  reg sensor_entrance;
  reg sensor_exit;
  reg [1:0] password_1;
  reg [1:0] password_2;

  // Outputs
  wire GREEN_LED;
  wire RED_LED;
  wire [6:0] HEX_1;
  wire [6:0] HEX_2;

  parking_system uut (
  clk, 
  reset_n, 
  sensor_entrance, 
  sensor_exit, 
  password_1, 
  password_2,
  GREEN_LED, 
  RED_LED, 
  HEX_1, 
  HEX_2
 );
 initial begin
 clk = 0;
 forever #10 clk = ~clk;
 end
 initial begin

$dumpfile("ps_tb.vcd");
$dumpvars(0,ps_tb);
 // Initialize Inputs
 reset_n = 0;
 sensor_entrance = 0;
 sensor_exit = 0;
 password_1 = 0;
 password_2 = 0;
 
 #100;
      reset_n = 1;
 #20;
 sensor_entrance = 1;
 #1000;
 sensor_entrance = 0;
 password_1 = 1;
 password_2 = 2;
 #2000;
 sensor_exit =1;
 
 
 end
      
endmodule