`timescale 1ns/1ps
module theta3_calc (
    input  wire a9,
    input  wire a10,
    input  wire a11,
    input  wire a12,
    input  wire a13,
    input  wire a14,
    input  wire a15,
    input  wire a16,

    output wire signed [31:0] theta3
);

assign theta3 =
      (a9  ? 32'sd2048 : 32'sd0)+ (a10 ? 32'sd1024 : 32'sd0)
    + (a11 ? 32'sd512  : 32'sd0)+ (a12 ? 32'sd256  : 32'sd0)
    + (a13 ? 32'sd128  : 32'sd0)+ (a14 ? 32'sd64   : 32'sd0)
    + (a15 ? 32'sd32   : 32'sd0)+ (a16 ? 32'sd16   : 32'sd0);

endmodule