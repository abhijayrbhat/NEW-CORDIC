`timescale 1ns/1ps

module tb_cordic;

    reg  [16:0] a;
    wire signed [21:0] x17;
    wire signed [21:0] y17;

    real angle;
    real expected_x;
    real expected_y;
    real actual_x;
    real actual_y;
    real error_x;
    real error_y;

    CORDIC dut (
        .a(a),
        .x17(x17),
        .y17(y17)
    );

    task test_input;
        input [16:0] angle_q16;

        begin
            a = angle_q16;
            #10;

            angle = $itor($unsigned(a)) / 65536.0;

            expected_x = $cos(angle);
            expected_y = $sin(angle);

            actual_x = $itor($signed(x17)) / 1048576.0;
            actual_y = $itor($signed(y17)) / 1048576.0;

            error_x = actual_x - expected_x;
            error_y = actual_y - expected_y;

            $display("--------------------------------------------------");
            $display("Input Q16       : %0d", $unsigned(a));
            $display("Angle           : %f rad", angle);

            $display("COS RTL         : %f", actual_x);
            $display("COS reference   : %f", expected_x);
            $display("COS error       : %e", error_x);

            $display("SIN RTL         : %f", actual_y);
            $display("SIN reference   : %f", expected_y);
            $display("SIN error       : %e", error_y);

            if ((error_x < 0.0001 && error_x > -0.0001) &&
                (error_y < 0.0001 && error_y > -0.0001))
                $display("RESULT          : PASS");
            else
                $display("RESULT          : FAIL");
        end
    endtask

    initial begin

        $display("==============================================");
        $display("     ALGORITHM 1 CORDIC VERIFICATION");
        $display("==============================================");

        // 1. 0 rad
        test_input(17'd0);

        // 2. ~0.25 rad
        test_input(17'd16384);

        // 3. ~0.5 rad
        test_input(17'd32768);

        // 4. ~1.0 rad
        test_input(17'd65536);

        // 5. ~1.5 rad
        test_input(17'd98304);

        // 6. ~2.0 rad
        test_input(17'd131071);

        $display("==============================================");
        $display("             TEST COMPLETE");
        $display("==============================================");

        $finish;
    end

endmodule