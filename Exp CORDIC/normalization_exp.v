module normalization_exp (
    input  wire signed [31:0] x17,
    input  wire signed [31:0] y17,

    output wire signed [31:0] exp_out_q20
);

localparam signed [31:0] KNORM_INV_Q20 = 32'sd3501088;

wire signed [32:0] xy_sum;
wire signed [64:0] normalized_product;

assign xy_sum = x17 + y17;


assign normalized_product =
        xy_sum * KNORM_INV_Q20;

assign exp_out_q20 =
        normalized_product >>> 20;


endmodule