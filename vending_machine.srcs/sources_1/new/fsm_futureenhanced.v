`timescale 1ns / 1ps

module fsm_futureenhanced(
    input clk,
    input rst,
    input one, two, five,
    input select,           
    input admin,           
    input [3:0] tea_refill, coffee_refill, 
    output reg dispense_tea,
    output reg dispense_coffee,
    output reg [3:0] change,
    output reg msg_ready,
    output reg msg_dispensed,
    output reg msg_out_of_stock,
    output reg msg_insufficient
);

    reg [3:0] balance;
    reg [3:0] tea_stock = 4'd5;
    reg [3:0] coffee_stock = 4'd5;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            balance <= 0;
            tea_stock <= 4'd5;
            coffee_stock <= 4'd5;
            dispense_tea <= 0;
            dispense_coffee <= 0;
            change <= 0;
            msg_ready <= 1;
            msg_dispensed <= 0;
            msg_out_of_stock <= 0;
            msg_insufficient <= 0;
        end else begin
            // Clear outputs by default
            dispense_tea <= 0;
            dispense_coffee <= 0;
            change <= 0;
            msg_ready <= 0;
            msg_dispensed <= 0;
            msg_out_of_stock <= 0;
            msg_insufficient <= 0;

            if (admin) begin
                tea_stock <= tea_refill;
                coffee_stock <= coffee_refill;
                balance <= 0;
                msg_ready <= 1;
            end else begin
                msg_ready <= 1;

                // Coin inputs
                if (one) balance <= balance + 1;
                else if (two) balance <= balance + 2;
                else if (five) balance <= balance + 5;

                // Selection handling
                if (select == 0 && balance >= 5) begin
                    if (tea_stock > 0) begin
                        dispense_tea <= 1;
                        msg_dispensed <= 1;
                        tea_stock <= tea_stock - 1;
                        change <= balance - 5;
                        balance <= 0;
                    end else begin
                        msg_out_of_stock <= 1;
                    end
                end else if (select == 1 && balance >= 7) begin
                    if (coffee_stock > 0) begin
                        dispense_coffee <= 1;
                        msg_dispensed <= 1;
                        coffee_stock <= coffee_stock - 1;
                        change <= balance - 7;
                        balance <= 0;
                    end else begin
                        msg_out_of_stock <= 1;
                    end
                end else if ((select == 0 && balance < 5) || (select == 1 && balance < 7)) begin
                    msg_insufficient <= 1;
                end
            end
        end
    end
endmodule
