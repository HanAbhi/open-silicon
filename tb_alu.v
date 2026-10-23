module tb_alu;

reg [3:0] A, B;
reg [2:0] op;
wire [3:0] Y;
wire carry_out;

reg [4:0] expected;
integer i, j, k;
integer errors;

alu dut (
    .A(A),
    .B(B),
    .op(op),
    .Y(Y),
    .carry_out(carry_out)
);

initial begin
    errors = 0;

    for (k = 0; k < 6; k = k + 1) begin
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                A = i;
                B = j;
                op = k;
                #1;

                case (k)
                    0: expected = A + B;
                    1: expected = {1'b0, A - B};
                    2: expected = {1'b0, A & B};
                    3: expected = {1'b0, A | B};
                    4: expected = {1'b0, A ^ B};
                    5: expected = {1'b0, ~A};
                endcase

                if ({carry_out, Y} !== expected) begin
                    errors = errors + 1;
                    $display(
                        "FAIL: op=%d A=%d B=%d got=%b expected=%b",
                        k, i, j, {carry_out, Y}, expected
                    );
                end
            end
        end
    end

    if (errors == 0)
        $display("PASS: All 1536 ALU test cases passed.");
    else
        $display("FAIL: %d test cases failed.", errors);

    $finish;
end

endmodule
