module counter #(
    parameter N = 8                 //number of bits of the counter
)(
    input wire clk,
    input wire rst_n,
    input wire en,
    output reg [N-1:0] count,
    output wire overflow
);

assign overflow = (count ==  {N{1'b1}}) & en;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        count <= 0;
    else if (en)
        count <= count + 1;
end

endmodule