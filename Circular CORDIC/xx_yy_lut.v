`timescale 1ns/1ps
module xx_yy_lut (
    input  wire [2:0] index,
    output reg signed [31:0] x3,
    output reg signed [31:0] y3
);

	always @(*) begin
		 case (index)

			  3'b000: begin
					x3 = 32'sd1037958;y3 = 32'sd128268;
			  end

			  3'b001: begin
					x3 = 32'sd973957;y3 = 32'sd381076;
			  end

			  3'b010: begin
					x3 = 32'sd849399;y3 = 32'sd610190;
			  end

			  3'b011: begin
					x3 = 32'sd672030;y3 = 32'sd801365;
			  end

			  3'b100: begin
					x3 = 32'sd452877;y3 = 32'sd942715;
			  end

			  3'b101: begin
					x3 = 32'sd205567;y3 = 32'sd1025452;
			  end

			  3'b110: begin
					x3 = -32'sd54525;y3 = 32'sd1044432;
			  end

			  3'b111: begin
					x3 = -32'sd311226;y3 = 32'sd998473;
			  end

			  default: begin
					x3 = 32'sd0;
					y3 = 32'sd0;
			  end

		 endcase
	end

endmodule