module up_down_counter_tb;

reg clk, rst,up;
wire [3:0] count;

  up_down_counter uut(.clk(clk),
    .rst(rst),.up(up),
    .count(count)
    
);

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
  $dumpvars;

  $monitor("time=%0t rst=%b up=%b count=%d",
           $time, rst,up,count);
end

initial begin
    clk = 0;
    rst = 1;
    up  = 1;

    #10;
    rst = 0;
    up = 1;

    #150;
   up=0;
  #150;

    $finish;
end

endmodule
