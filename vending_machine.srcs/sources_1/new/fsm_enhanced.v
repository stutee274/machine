module fsm_enhanced(
    input clk,
    input rst,
    input one, two, five,
    input select, 
    output reg dispense_tea,
    output reg dispense_coffee,
    output reg [3:0] change
);
    reg [3:0] balance; 

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            balance <= 0;
            dispense_tea <= 0;
            dispense_coffee <= 0;
            change <= 0;
        end else begin
            dispense_tea <= 0;
            dispense_coffee <= 0;
            change <= 0;

            if (one) balance <= balance + 1;
            else if (two) balance <= balance + 2;
            else if (five) balance <= balance + 5;

            if (select == 0 && balance >= 5) begin
                dispense_tea <= 1;
                change <= balance - 5;
                balance <= 0;
            end else if (select == 1 && balance >= 7) begin
                dispense_coffee <= 1;
                change <= balance - 7;
                balance <= 0;
            end
        end
    end
endmodule
