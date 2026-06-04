module async_tb;
  reg clk,rst;
  reg [7:0] d;
  wire [7:0] q;
  async_8bit  uut(.clk(clk),.rst(rst),.d(d),.q(q));
  always #5 clk =~clk;
 initial begin
    $monitor("time=%0t rst=%b d=%h q=%h",
             $time, rst, d, q);
 end
  
 initial begin
    clk = 0;
    rst = 1;
    d   = 8'h06;

    #10;
    rst = 0;

    d = 8'h05;

    #7;
    rst = 1;

    #3;
    rst = 0;

    #10;
    d = 8'hAA;

    #10;
    $finish;
end
endmodule
   
