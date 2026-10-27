`timescale 1ns/1ps


module tb_cordic_algo1_sweep;

    reg [16:0] a;

    wire signed [21:0] x17;
    wire signed [21:0] y17;

    integer file_handle;
    integer i;

    CORDIC dut (
        .a   (a),
        .x17 (x17),
        .y17 (y17)
    );

    initial begin

        file_handle = $fopen("algo1_cordic_results.csv", "w");

        if (file_handle == 0) begin
            $display("ERROR: Cannot create algo1_cordic_results.csv");
            $finish;
        end

        $fdisplay(file_handle, "a_decimal,x17,y17");


        for (i = 0; i < 131072; i = i + 1) begin

            a = i;
            #1;

            $fdisplay(file_handle, "%0d,%0d,%0d",a, $signed(x17), $signed(y17));

        end

        $fclose(file_handle);

        $display("Created algo1_cordic_results.csv");
        $display("Total test vectors = 131072");

        $finish;

    end

endmodule