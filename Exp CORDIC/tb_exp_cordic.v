`timescale 1ns/1ps

// Plain Verilog testbench for Algorithm 2 / EXP_CORDIC.
// Compile this file together with the corrected EXP_CORDIC design file.

module tb_exp_cordic;

    reg  [16:0] a;
    wire signed [31:0] x17;
    wire signed [31:0] y17;
    wire signed [31:0] exp_out_q20;

    EXP_CORDIC dut (
        .a           (a),
        .x17         (x17),
        .y17         (y17),
        .exp_out_q20 (exp_out_q20)
    );

    task report_result;
        begin
            $display("------------------------------------------------------------");
            $display("time = %0t ns", $time);
            $display("a             = %b  (decimal %0d)", a, a);
            $display("x17, y17      = %0d, %0d", $signed(x17), $signed(y17));
            $display("exp_out_q20   = %0d", $signed(exp_out_q20));
        end
    endtask
	 
task debug_zero_input;
    begin
        a = 17'd0;
        #10;

        $display("=== HYPERBOLIC CORDIC: ZERO INPUT ===");
        $display("x3, y3       = %0d, %0d", $signed(dut.x3), $signed(dut.y3));
        $display("x4, y4       = %0d, %0d", $signed(dut.x4), $signed(dut.y4));
        $display("x5, y5       = %0d, %0d", $signed(dut.x5), $signed(dut.y5));
        $display("x6, y6       = %0d, %0d", $signed(dut.x6), $signed(dut.y6));
        $display("x7, y7       = %0d, %0d", $signed(dut.x7), $signed(dut.y7));
        $display("x8, y8       = %0d, %0d", $signed(dut.x8), $signed(dut.y8));
        $display("x9, y9       = %0d, %0d", $signed(dut.x9), $signed(dut.y9));
        $display("delta, theta3, z = %0d, %0d, %0d",
                 $signed(dut.delta), $signed(dut.theta3), $signed(dut.z));
        $display("x17, y17     = %0d, %0d", $signed(x17), $signed(y17));
        $display("exp_out_q20  = %0d", $signed(exp_out_q20));
        $display("exp result   = %f", $itor($signed(exp_out_q20))/1048576.0);
    end
endtask


task debug_case;
    input [16:0] test_a;

    begin
        a = test_a;
        #10;

        $display("============================================================");
        $display("a decimal       = %0d", a);
        $display("a binary        = %b", a);
        $display("lut_index       = %0d", dut.lut_index);

        $display("x3, y3          = %0d, %0d",
                 $signed(dut.x3), $signed(dut.y3));

        $display("x9 + y9         = %0d",
         $signed(dut.x9) + $signed(dut.y9));

$display("correction_x     = %0d",
         $signed((dut.z * dut.y9) >>> 20));

$display("correction_y     = %0d",
         $signed((dut.z * dut.x9) >>> 20));

        $display("delta           = %0d", $signed(dut.delta));
        $display("theta3          = %0d", $signed(dut.theta3));
        $display("z               = %0d", $signed(dut.z));

        $display("x17, y17        = %0d, %0d",
                 $signed(x17), $signed(y17));

        $display("x17 + y17       = %0d",
                 $signed(x17) + $signed(y17));

        $display("exp_out_q20     = %0d",
                 $signed(exp_out_q20));

        $display("exp_out_real    = %f",
                 $itor($signed(exp_out_q20)) / 1048576.0);
    end
endtask

   initial begin
    debug_case(17'd32767);
    debug_case(17'd32768);

    $display("============================================================");
    $display("Two-point boundary diagnostic complete.");
    $finish;
end
endmodule











