module sync_8bit_tb;
  reg clk,rst;
  reg [7:0] d;
  wire [7:0] q;
  sync_8bit uut (.clk(clk),.rst(rst),.d(d),.q(q));
  always #5 clk =~clk;
 initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    $monitor("time=%0t rst=%b d=%h q=%h",
             $time, rst, d, q);
 end
  
 initial begin 
   clk=0;
   rst=1;
   d=8'h06;
   
   #10
   rst =0;
   d=8'h05;
   
   #10
   d= 8'h08;
   #10
   $finish;
 end
endmodule
   
