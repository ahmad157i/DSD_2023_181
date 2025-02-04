

module Exp(
    input a,
    input b,
    input c,
    output x,
    output y
    );
    assign or = a | b;
    assign x = (~c) ^ or;
    assign xor = (~(a & b)) ^ (or);
    assign y = or & xor;
endmodule
