`timescale 1ns/1ps
module delta_calc (
    input  wire a3,
    input  wire a4,
    input  wire a5,

    output wire signed [31:0] delta
);

		assign delta =(a3 ? 32'sd170 : 32'sd0) + (a4 ? 32'sd21  : 32'sd0) + (a5 ? 32'sd3   : 32'sd0);

endmodule