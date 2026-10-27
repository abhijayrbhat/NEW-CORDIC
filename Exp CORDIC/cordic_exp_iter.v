module cordic_exp_iter #(
    parameter SHIFT = 4
)(
    input  wire signed [31:0] x_in,
    input  wire signed [31:0] y_in,
    input  wire               a_bit,

    output wire signed [31:0] x_out,
    output wire signed [31:0] y_out
);

assign x_out = a_bit ?
               (x_in + (y_in >>> SHIFT)) :
               (x_in - (y_in >>> SHIFT));

assign y_out = a_bit ?
               (y_in + (x_in >>> SHIFT)) :
               (y_in - (x_in >>> SHIFT));

endmodule