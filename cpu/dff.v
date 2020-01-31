module dff (d, q, clk, rst);
    input d, clk, rst;
    output reg q;

    always @(posedge clk) begin
        if (rst) q <= 0;
        else q <= d;
    end
endmodule