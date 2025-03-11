module bit_sum #(
    parameter DATA_W = 10,
    parameter POS_W = 4
)(
    input wire [DATA_W-1:0] in,
    output wire [POS_W-1:0] bit_sum);

    integer i;
    reg [POS_W-1:0] sum;
    always @(*) begin
        sum = 0;
        for (i = 0; i < DATA_W; i = i + 1) begin
            sum = sum + in[i];
        end
    end

    assign bit_sum = sum;
endmodule
