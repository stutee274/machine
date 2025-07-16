`timescale 1ns / 1ps
    module tb1;
    reg clk = 0;
    reg rst = 1;
    reg one = 0, two = 0;
    wire dispense;
    wire [2:0] change;

   fsm_basic uut (.clk(clk), .rst(rst), .one(one), .two(two), .dispense(dispense), .change(change));

    always #5 clk = ~clk;

    initial begin
        $dumpfile("vending.vcd");
        $dumpvars(0, tb1);
        #10 rst = 0;
        #10 two = 1; #10 two = 0;       
        #10 two = 1; #10 two = 0;       
        #10 two = 1; #10 two = 0;       
        #10 one = 1; #10 one = 0;       
        #10 one = 1; #10 one = 0;       
        #40;

        $finish;
    end
endmodule
