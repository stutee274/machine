module fsm_basic(
    input clk,
    input rst,
    input one,       
    input two,      
    output reg dispense,
    output reg [2:0] change
);

    reg [2:0] state;

    parameter S0=3'd0, S1=3'd1, S2=3'd2, S3=3'd3, S4=3'd4, S5=3'd5;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= S0;
            dispense <= 0;
            change <= 0;
        end else begin
            dispense <= 0;
            change <= 0;
            case (state)
                S0: if (one) state <= S1; else if (two) state <= S2;
                S1: if (one) state <= S2; else if (two) state <= S3;
                S2: if (one) state <= S3; else if (two) state <= S4;
                S3: if (one) state <= S4; else if (two) state <= S5;
                S4: if (one) state <= S5;
                    else if (two) begin state <= S5; change <= 1; end
                S5: begin
                    dispense <= 1;
                    state <= S0;
                    change <= 0;
                end
            endcase
        end
    end
endmodule
