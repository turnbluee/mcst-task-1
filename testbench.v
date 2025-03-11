module testbench;
    parameter DATA_W = 16;
    parameter POS_W = 4;
    reg clk;
    reg rst;
    reg [DATA_W-1:0] in;
    wire [POS_W-1:0] out;

    vec_sum #(.DATA_W(DATA_W), .POS_W(POS_W)) example (
        .data(in),
        .sum(out),
        .clock(clk),
        .reset(rst)
    );

    always #1 clk = ~clk;

    initial begin

        clk <= 0;
        rst <= 1;
        in <= 0;

        #1;

        rst <= 0;
        in = 16'b1001101010100011;

        #6;

        rst <= 1;

        #2;

        rst <= 0;
        in = 16'b0010101111010111;

        #6;
        $finish;
    end
    `include "dump_settings.v"
endmodule     
