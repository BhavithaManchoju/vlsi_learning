module FSM_tb();
  reg clk;
  reg rst;
  reg x;
  wire z;
  
  FSM uut(.clk(clk),.rst(rst),.x(x),.z(z));
  always #5 clk = ~clk;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    $monitor("time=%0t,clk=%b,rst=%b,x=%b,z=%b",$time,clk,rst,x,z);
  end
  initial begin
    clk=0;
    rst=1;
    x=1;
    #10;
    rst=0;
    x=0;
    #10;
    x=1;
    #10;
    x=0;
    #10;
    x=1;
    #10;
    x=1;
    #10;
    x=0;
    #10;
    x=0;
    #10;
    $finish;
  end
endmodule
