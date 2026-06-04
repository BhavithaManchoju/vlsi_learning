module mod_10_tb;

reg clk, rst;
wire [3:0] count;

mod_10 uut(
    .clk(clk),
    .rst(rst),
    .count(count)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, mod_10_tb);

    $monitor("time=%0t rst=%b count=%d",
             $time, rst, count);
end

initial begin
    clk = 0;
    rst = 1;

    #10;
    rst = 0;

    #120;

    $finish;
end

endmodule
