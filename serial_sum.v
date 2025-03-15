module serial_sum #(
    parameter DATA_W = 10,
    parameter POS_W = $clog2(DATA_W + 1)
)(
    input wire [DATA_W-1:0] data,
    output wire [POS_W-1:0] sum
);
    wire [POS_W-1:0] subtotal [0:DATA_W];
    assign subtotal[0] = {POS_W{1'b0}};
    assign sum = subtotal[DATA_W];

    generate
        for (genvar i = 0; i < DATA_W; i = i + 1) begin
            assign subtotal[i + 1] = subtotal[i] + data[i];
        end
    endgenerate
endmodule
