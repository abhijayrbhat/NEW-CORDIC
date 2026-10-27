module xx_h_yy_h_lut (
    input  wire [2:0] index,

    output reg signed [31:0] x3,
    output reg signed [31:0] y3
);

always @(*) begin

    case (index)

        3'b000: begin
            x3 = 32'sd317215;
            y3 = 32'sd38496;
        end

        3'b001: begin
            x3 = 32'sd336983;
            y3 = 32'sd120059;
        end

        3'b010: begin
            x3 = 32'sd377820;
            y3 = 32'sd208818;
        end

        3'b011: begin
            x3 = 32'sd442696;
            y3 = 32'sd311186;
        end

        3'b100: begin
            x3 = 32'sd535212;
            y3 = 32'sd432792;
        end

        3'b101: begin
            x3 = 32'sd661350;
            y3 = 32'sd581585;
        end

        3'b110: begin
            x3 = 32'sd829041;
            y3 = 32'sd766920;
        end

        3'b111: begin
            x3 = 32'sd1048568;
            y3 = 32'sd1000176;
        end

        default: begin
            x3 = 32'sd0;
            y3 = 32'sd0;
        end

    endcase

end

endmodule