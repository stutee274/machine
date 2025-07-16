module tb2;
    reg clk = 0;
    reg rst = 1;
    reg one = 0, two = 0, five = 0;
    reg select = 0;
    wire dispense_tea, dispense_coffee;
    wire [3:0] change;

    fsm_enhanced  uut (
        .clk(clk), .rst(rst),
        .one(one), .two(two), .five(five),
        .select(select),
        .dispense_tea(dispense_tea),
        .dispense_coffee(dispense_coffee),
        .change(change)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("enhanced_vending.vcd");
        $dumpvars(0, tb2);

        #10 rst = 0;

       
        select = 0;
        #10 two = 1; #10 two = 0;
        #10 two = 1; #10 two = 0;
        #10 one = 1; 
        #10 one = 0;
        #10 two = 1; #10 two =0;
        #50;

       
        select = 1;
        #10 five = 1; #10 five = 0;
        #10 one = 1; # 10 one =0;
        #10 two = 1; #10 two = 0;
        #20;

        select = 1;
        #10 five = 1; #10 five = 0;
        #10 five = 1; #10 five = 0;
        #20;

        $finish;
    end
endmodule
