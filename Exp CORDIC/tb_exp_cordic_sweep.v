`timescale 1ns/1ps

// Simulation-only Verilog testbench.
// Sweeps Algorithm 2 over the full unsigned-Q16 input range and writes
// actual RTL outputs to exp_cordic_results.csv for MATLAB plotting.

module tb_exp_cordic_sweep;

    reg  [16:0] a;
    wire signed [31:0] x17;
    wire signed [31:0] y17;
    wire signed [31:0] exp_out_q20;
    //wire signed [31:0] exp_out_q16;
    integer file_handle;
    integer i;

    EXP_CORDIC dut (
        .a           (a),
        .x17         (x17),
        .y17         (y17),
        .exp_out_q20 (exp_out_q20)
    );

    initial begin
        file_handle = $fopen("exp_cordic_results.csv", "w");
        if (file_handle == 0) begin
            $display("ERROR: Cannot create exp_cordic_results.csv");
            $finish;
        end

        $fdisplay(file_handle, "a_decimal,exp_out_q20,exp_out_q16");

        // a is unsigned Q16: x = a / 65536.  Full range: 0 to 1.9999847.
        for (i = 0; i < 131072; i = i + 1) begin
            a = i;
            #1; // Let the combinational DUT settle before recording its output.
            $fdisplay(file_handle, "%0d,%0d", a,
                      $signed(exp_out_q20));
        end

        $fclose(file_handle);
        $display("Created exp_cordic_results.csv with 131072 test vectors.");
        $finish;
    end

endmodule