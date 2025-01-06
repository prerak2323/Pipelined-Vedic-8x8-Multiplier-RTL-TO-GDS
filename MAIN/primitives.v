// AND Gate
module AND2_X1 (output Y, input A, input B);
    assign Y = A & B;
endmodule

// D Flip-Flop
module DFF_X1 (output reg Q, input D, input CLK);
    always @(posedge CLK) begin
        Q <= D;
    end
endmodule

// 2-to-1 Multiplexer
module MUX2_X1 (output Y, input A, input B, input S);
    assign Y = S ? B : A;
endmodule

// OR Gate
module OR2_X1 (output Y, input A, input B);
    assign Y = A | B;
endmodule

// XOR Gate
module XOR2_X1 (output Y, input A, input B);
    assign Y = A ^ B;
endmodule

