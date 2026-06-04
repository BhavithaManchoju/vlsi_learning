module shift_reg_tb();
  reg clk,rst,serial_in;
  wire [3:0]q;
  
  shift_reg uut(.clk(clk),.rst(rst),.serial_in(serial_in),.q(q));

    always #5 clk = ~clk;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    $monitor("time=%0t,clk=%b,rst=%b,serial_in=%b,q=%b",$time,clk,rst,serial_in,q);
  end
  initial begin
    clk=0;
    rst=1;
    serial_in=1;
    #10;
    rst=0;
    serial_in= 1;
    #10;
    serial_in=0;
    #10;
    serial_in=1;
    #10;
    serial_in=1;
    #10;
    $finish;
  end
endmodule
