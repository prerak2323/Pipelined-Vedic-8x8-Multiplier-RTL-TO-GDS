module vedic4x4(
    input [3:0] a,
    input [3:0] b,
    output [7:0] prod,
    output overflow,
    input ground
);



    wire [3:0] prodm2, prodm1, prodm0, prodm3, sums1, sums2;
    wire c1, c2;
    wire cnet = c1 | c2;

    vedic2x2 M0(
        .a(a[1:0]),
        .b(b[1:0]),
        .prod(prodm0),
        .ground(ground)
    );
    
    vedic2x2 M1(
        .a(a[1:0]),
        .b(b[3:2]),
        .prod(prodm1),
        .ground(ground)
    );
    
    vedic2x2 M2(
        .a(a[3:2]),
        .b(b[1:0]),
        .prod(prodm2),
        .ground(ground)
    );
    
    vedic2x2 M3(
        .a(a[3:2]),
        .b(b[3:2]),
        .prod(prodm3),
        .ground(ground)
    );
        
    csa4 stage1(
        .a(prodm1),
        .b(prodm2),
        .cin(ground),
        .sum(sums1),
        .cout(c1),
        .ground(ground)
    );

    csa4 stage2(
        .a({{2{ground}}, prodm0[3:2]}),
        .b(sums1),
        .cin(ground),
        .sum(sums2),
        .cout(c2),
        .ground(ground)
    );
    
    csa4 stage3(
        .a({ground, cnet, sums2[3:2]}),
        .b(prodm3),
        .cin(ground),
        .sum(prod[7:4]),
        .cout(overflow),
        .ground(ground)
    );
    
    assign prod[1:0] = prodm0[1:0];
    assign prod[3:2] = sums2[1:0];
endmodule

