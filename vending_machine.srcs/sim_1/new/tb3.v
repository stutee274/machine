`timescale 1ns / 1ps


module tb3;

  reg clk, rst;
  reg one, two, five;
  reg select;
  reg admin;
  reg [3:0] tea_refill, coffee_refill;
  wire dispense_tea, dispense_coffee;
  wire [3:0] change;
  wire msg_ready, msg_dispensed, msg_out_of_stock, msg_insufficient;

  // DUT instantiation
  fsm_futureenhanced uut (
    .clk(clk), .rst(rst), .one(one), .two(two), .five(five),
    .select(select), .admin(admin),
    .tea_refill(tea_refill), .coffee_refill(coffee_refill),
    .dispense_tea(dispense_tea), .dispense_coffee(dispense_coffee),
    .change(change),
    .msg_ready(msg_ready), .msg_dispensed(msg_dispensed),
    .msg_out_of_stock(msg_out_of_stock), .msg_insufficient(msg_insufficient)
  );

  // Clock Generation
  always #5 clk = ~clk;

  initial begin
    $dumpfile("fsm_enhanced.vcd");
    $dumpvars(0, tb3);

    // Initialize
    clk = 0; rst = 1; one = 0; two = 0; five = 0;
    select = 0; admin = 0;
    tea_refill = 0; coffee_refill = 0;
    #10 rst = 0;

    
    #10 two = 1; #10 two = 0;
    #10 two = 1; #10 two = 0;
    #10 one = 1; #10 one = 0;
    #10 select = 0;
    #20;

    
    #10 five = 1; #10 five = 0;
    #10 select = 1;
    #20;

   
    #10 two = 1; #10 two = 0;
    #10 select = 1;
    #20;

    
    #10 admin = 1; tea_refill = 4'd3; coffee_refill = 4'd2;
    #10 admin = 0;

    
    #10 five = 1; #10 five = 0;
    #10 select = 0;
    #20;

    $finish;
  end
endmodule
