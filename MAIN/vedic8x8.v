module vedic8x8(
    input [7:0] a,
    input [7:0] b,
    input clk,
    output reg [15:0] prod,
    output overflow,
    input ground
);



    wire [7:0] prodm2, prodm1, prodm0, prodm3, sums1, sums2, sums3;
    wire c1, c2;
    wire ov1, ov2, ov3, ov4;
    reg [7:0] prodm0_s0, prodm1_s0, prodm2_s0, prodm3_s0;
    reg c1_s1, c2_s2, c1_s2;
    reg [7:0] prodm0_s1, prodm3_s1, sum_s1, sum_s2;
    reg [7:0] prodm0_s2, prodm3_s2;

    vedic4x4 M0(
        .a(a[3:0]),
        .b(b[3:0]),
        .prod(prodm0),
        .overflow(ov1),
        .ground(ground)
    );
    
    vedic4x4 M1(
        .a(a[3:0]),
        .b(b[7:4]),
        .prod(prodm1),
        .overflow(ov2),
        .ground(ground)
    );
    
    vedic4x4 M2(
        .a(a[7:4]),
        .b(b[3:0]),
        .prod(prodm2),
        .overflow(ov3),
        .ground(ground)
    );
    
    vedic4x4 M3(
        .a(a[7:4]),
        .b(b[7:4]),
        .prod(prodm3),
        .overflow(ov4),
        .ground(ground)
    );
    
    always @(posedge clk)
    begin
        prodm0_s0 <= prodm0;
        prodm1_s0 <= prodm1;
        prodm2_s0 <= prodm2;
        prodm3_s0 <= prodm3;
    end

    csa8 stage1(
        .a(prodm1_s0),
        .b(prodm2_s0),
        .cin(ground),
        .sum(sums1),
        .cout(c1),
        .ground(ground)
    );
    
    always @(posedge clk)
    begin
        sum_s1 <= sums1;
        c1_s1 <= c1;
        prodm0_s1 <= prodm0_s0;
        prodm3_s1 <= prodm3_s0;
    end

    csa8 stage2(
        .a({{4{ground}}, prodm0_s1[7:4]}),
        .b(sum_s1),
        .cin(ground),
        .sum(sums2),
        .cout(c2),
        .ground(ground)
    );
    
    always @(posedge clk)
    begin
        c2_s2 <= c2;
        c1_s2 <= c1_s1;
        sum_s2 <= sums2;
        prodm0_s2 <= prodm0_s1;
        prodm3_s2 <= prodm3_s1;
    end

    csa8 stage3(
        .a({{3{ground}}, {c1_s2 | c2_s2}, sum_s2[7:4]}),
        .b(prodm3_s2),
        .cin(ground),
        .sum(sums3),
        .cout(overflow),
        .ground(ground)
    );
    
    always @(posedge clk)
    begin
        prod <= {sums3, sum_s2[3:0], prodm0_s2[3:0]};
    end

endmodule
