`timescale 1ns/1ps

module tb_counter;

    reg clk, rst_n, en;
    wire [7:0] count;
    wire overflow;

    counter #(.N(8)) DUT (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .count(count),
        .overflow(overflow)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("sim/counter.vcd");
        $dumpvars(0, tb_counter);
    end

    initial begin
        rst_n = 0; en = 0;
        #20 rst_n = 1;
        #10 en = 1;
        #2000;
        en = 0;
        #50;
        $finish;
    end

    initial begin
        $monitor("t=%0t | count=%0d | overflow=%b",
        $time, count, overflow);
    end

endmodule