`timescale 1ns / 1ps

module vedic8x8_tb;

    // Inputs
    reg [7:0] a;
    reg [7:0] b;
    reg clk;

    // Outputs
    wire [15:0] prod;
    wire overflow;

    // Instantiate the DUT (Device Under Test)
    vedic8x8 uut (
        .a(a),
        .b(b),
        .clk(clk),
        .prod(prod),
        .overflow(overflow)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Stimulus
    initial begin
    $dumpfile("res.vcd"); $dumpvars;
    
        // Initialize inputs
        a = 8'd0;
        b = 8'd0;

        // Apply test cases
        #10;
        a = 8'd15; b = 8'd3; // 15 * 3 = 45
        #10;
        a = 8'd25; b = 8'd10; // 25 * 10 = 250
        #10;
        a = 8'd50; b = 8'd50; // 50 * 50 = 2500
        #10;
        a = 8'd100; b = 8'd200; // 100 * 200 = 20000
        #10;
        a = 8'd255; b = 8'd255; // 255 * 255 = 65025
        #10;

        // Edge cases
        a = 8'd1; b = 8'd255; // 1 * 255 = 255
        #10;
        a = 8'd0; b = 8'd255; // 0 * 255 = 0
        #10;
        a = 8'd128; b = 8'd128; // Overflow case check (128 * 128)

        #20;
       #1000000 $finish; // End simulation
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t | a=%d | b=%d | prod=%d | overflow=%b", $time, a, b, prod, overflow);
    end

endmodule

