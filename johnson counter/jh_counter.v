`timescale 1ns / 1ps

module JohnsonCounter(
    input clk,         
    input reset,       
    output reg [3:0] q 
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 4'b0000; 
        end else begin
            q <= {~q[0], q[3:1]}; 
        end
    end
endmodule
