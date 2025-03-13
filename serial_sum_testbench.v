module testbench;
    
    parameter DATA_W = 10;
    parameter POS_W = 4;
    reg [DATA_W-1:0] num;

    serial_sum #(.DATA_W(DATA_W), .POS_W(POS_W)) serial
    (.data(num));

    initial begin
        num = 4'b1010;
        #5;

        num = 4'b1111;
        #5;

        num = 4'b1001;
        #5;
    end

    `include "dump_settings.v"

endmodule
