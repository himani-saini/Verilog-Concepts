module seq_detector(x, clk, reset, y);
    input x, clk, reset;
    output reg y;

    // State definitions
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
    reg [1:0] PS, NS;  // Present state and next state

    // State transition on clock and reset
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            PS <= S0;
            y <= 1'b0;
        end else begin
            PS <= NS;
        end
    end

    // Next state logic and output logic
    always @(PS, x) begin
        case (PS)
            S0: begin
                y = 1'b0;
                NS = (x) ? S1 : S0;
            end
            S1: begin
                y = 1'b0;
                NS = (x) ? S2 : S0;
            end
            S2: begin
                y = 1'b0;
                NS = (x) ? S3 : S0;
            end
            S3: begin
                y = (x) ? 1'b1 : 1'b0; // Sequence detected
                NS = (x) ? S0 : S0;
            end
            default: begin
                y = 1'b0;
                NS = S0;
            end
        endcase
    end
endmodule
