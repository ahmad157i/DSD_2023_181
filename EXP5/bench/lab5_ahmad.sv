`timescale 1ns / 1ps
`timescale 1ns / 1ps

module lab5_ahmad(
    input logic [3:0] num,
    input logic [2:0] sel,
    output logic A, B, C, D, E, F, G, DP,
    output logic [7:0] AN
);
    always_comb begin
        // Cathodes for segments A to G
        A = (~num[3] & ~num[2] & num[1] & ~num[0]) | 
            (~num[3] & num[2] & ~num[1] & ~num[0]) | 
            (num[3] & num[2] & ~num[1] & num[0]) | 
            (num[3] & ~num[2] & num[1] & num[0]);

        B = (num[2] & num[1] & ~num[0]) | 
            (num[3] & num[1] & num[0]) | 
            (num[3] & num[2] & ~num[0]) | 
            (~num[3] & num[2] & ~num[1] & num[0]);

        C = (~num[3] & ~num[2] & num[1] & ~num[0]) | 
            (num[3] & num[2] & num[1]) | 
            (num[3] & num[2] & ~num[0]);

        D = (~num[3] & num[2] & ~num[1] & ~num[0]) | 
            (~num[3] & ~num[2] & ~num[1] & num[0]) | 
            (num[2] & num[1] & num[0]) | 
            (num[3] & ~num[2] & num[1] & ~num[0]);

        E = (~num[3] & num[0]) | 
            (~num[2] & ~num[1] & num[0]) | 
            (~num[3] & num[2] & ~num[1]);

        F = (~num[3] & ~num[2] & num[0]) | 
            (~num[3] & ~num[2] & num[1]) | 
            (~num[3] & num[1] & num[0]) | 
            (num[3] & num[2] & ~num[1] & num[0]);

        G = (~num[3] & ~num[2] & ~num[1]) | 
            (num[3] & num[2] & ~num[1] & ~num[0]) | 
            (~num[3] & num[2] & num[1] & num[0]);

        DP = 1; // Decimal point always on

        // Anodes for 7-segment display
        AN[0] = ~(sel[2] | sel[1] | sel[0]);
        AN[1] = ~(sel[2] | sel[1] | ~sel[0]);
        AN[2] = ~(sel[2] | ~sel[1] | sel[0]);
        AN[3] = ~(sel[2] | ~sel[1] | ~sel[0]);
        AN[4] = ~(~sel[2] | sel[1] | sel[0]);
        AN[5] = ~(~sel[2] | sel[1] | ~sel[0]);
        AN[6] = ~(~sel[2] | ~sel[1] | sel[0]);
        AN[7] = ~(~sel[2] | ~sel[1] | ~sel[0]);
    end
endmodule