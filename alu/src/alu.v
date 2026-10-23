module alu (
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] op,
    output reg [3:0] Y,
    output reg carry_out
);

always @(*) begin
    Y = 4'b0000;
    carry_out = 1'b0;

    case (op)
        3'b000: {carry_out, Y} = A + B;
        3'b001: Y = A - B;
        3'b010: Y = A & B;
        3'b011: Y = A | B;
        3'b100: Y = A ^ B;
        3'b101: Y = ~A;
        default: begin
            Y = 4'b0000;
            carry_out = 1'b0;
        end
    endcase
end

endmodule
