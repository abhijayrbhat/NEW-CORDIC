module linear_correction_exp (
    input  wire signed [31:0] x9,
    input  wire signed [31:0] y9,
    input  wire signed [31:0] z,

    output wire signed [31:0] x17,
    output wire signed [31:0] y17
);

wire signed [63:0] z_times_y;
wire signed [63:0] z_times_x;

assign z_times_y = z * y9;
assign z_times_x = z * x9;

assign x17 = x9 + (z_times_y >>> 20);
assign y17 = y9 + (z_times_x >>> 20);

endmodule