`timescale 1ns/1ps
module CORDIC (
    input  wire [16:0] a,

    output wire signed [31:0] x17,
    output wire signed [31:0] y17
);

wire [2:0] lut_index;

wire signed [31:0] x3;wire signed [31:0] y3;

wire signed [31:0] x4;wire signed [31:0] y4;

wire signed [31:0] x5;wire signed [31:0] y5;

wire signed [31:0] x6;wire signed [31:0] y6;

wire signed [31:0] x7;wire signed [31:0] y7;

wire signed [31:0] x8;wire signed [31:0] y8;

wire signed [31:0] x9;wire signed [31:0] y9;

wire signed [31:0] delta;
wire signed [31:0] theta3;
wire signed [31:0] z;


assign lut_index = a[16:14];


xx_yy_lut xx_yy_lut_inst (
    .index (lut_index),
    .x3    (x3),
    .y3    (y3)
);


//i=3
cordic_new_hypercon #(.SHIFT(4)) cordic_new_hypercon_n1 (
    .x_in  (x3),
    .y_in  (y3),
    .a_bit (a[13]),
    .x_out (x4),
    .y_out (y4)
);


//i=4
cordic_new_hypercon #(.SHIFT(5)) cordic_new_hypercon_n2 (
    .x_in  (x4),
    .y_in  (y4),
    .a_bit (a[12]),
    .x_out (x5),
    .y_out (y5)
);


//i=5

cordic_new_hypercon #(.SHIFT(6)) cordic_new_hypercon_n3 (
    .x_in  (x5),
    .y_in  (y5),
    .a_bit (a[11]),
    .x_out (x6),
    .y_out (y6)
);


//i=6

cordic_new_hypercon #(.SHIFT(7)) cordic_new_hypercon_n4 (
    .x_in  (x6),
    .y_in  (y6),
    .a_bit (a[10]),
    .x_out (x7),
    .y_out (y7)
);


//i=7

cordic_new_hypercon #(.SHIFT(8)) cordic_new_hypercon_n5 (
    .x_in  (x7),
    .y_in  (y7),
    .a_bit (a[9]),
    .x_out (x8),
    .y_out (y8)
);


//i=8

cordic_new_hypercon #(.SHIFT(9)) cordic_new_hypercon_n6 (
    .x_in  (x8),
    .y_in  (y8),
    .a_bit (a[8]),
    .x_out (x9),
    .y_out (y9)
);




delta_calc delta_calc_inst (
    .a3    (a[13]),
    .a4    (a[12]),
    .a5    (a[11]),
    .delta (delta)
);


theta3_calc theta3_calc_inst (
    .a9     (a[7]),
    .a10    (a[6]),
    .a11    (a[5]),
    .a12    (a[4]),
    .a13    (a[3]),
    .a14    (a[2]),
    .a15    (a[1]),
    .a16    (a[0]),
    .theta3 (theta3)
);


assign z = delta + theta3;


linear_correction linear_correction_inst (
    .x9  (x9),
    .y9  (y9),
    .z   (z),
    .x17 (x17),
    .y17 (y17)
);



endmodule