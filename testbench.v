module testbench;
    parameter DATA_W = 16;
    parameter POS_W = 4;
    reg clk;
    reg rst;
    reg [DATA_W-1:0] data;
    wire [POS_W-1:0] sum;

    vec_sum #(.DATA_W(DATA_W), .POS_W(POS_W)) example (
        .data(data),
        .sum(sum),
        .clock(clk),
        .reset(rst)
    );

    always #1 clk = ~clk;

    initial begin

        clk <= 1;
        rst <= 1;
        data <= 0;

        #2;

        rst <= 0;
        data = 16'b1001101010100011;

        #6;

        rst <= 1;

        #2;

        rst <= 0;
        data = 16'b0010101111010111;

        #6;

        rst <= 1;

        #2;

        rst <= 0;
        data = 16'b1110101010001110;

        #6;

        $finish;
    end
    `include "dump_settings.v"
endmodule     
