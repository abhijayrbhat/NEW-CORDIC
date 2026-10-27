`timescale 1ns/1ps

module linear_correction (
    input  wire signed [31:0] x9,
    input  wire signed [31:0] y9,
    input  wire signed [31:0] z,

    output wire signed [31:0] x17,
    output wire signed [31:0] y17
);

wire signed [63:0] z_times_y;
wire signed [63:0] z_times_x;

wire signed [63:0] correction_x_wide;
wire signed [63:0] correction_y_wide;

assign z_times_y = z * y9;
assign z_times_x = z * x9;

assign correction_x_wide = z_times_y >>> 20;
assign correction_y_wide = z_times_x >>> 20;

assign x17 = x9 - correction_x_wide[31:0];
assign y17 = y9 + correction_y_wide[31:0];

endmodule