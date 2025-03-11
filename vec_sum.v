module vec_sum #(
    parameter DATA_W = 10,
    parameter POS_W = $clog2(DATA_W)
)(
    input wire [DATA_W-1:0] data,
    output reg [POS_W-1:0] sum,
    input wire clock,
    input wire reset
);

    wire [POS_W-1:0] out;

    bit_sum #(.DATA_W(DATA_W), .POS_W(POS_W)) adder (
        .in(data),
        .bit_sum(out)
    );

    always @(posedge clock) begin
        sum <= (reset) ? 0 : out;
    end
    
endmodule
