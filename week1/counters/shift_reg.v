module shift_reg(
  input clk,
  input rst,
  input serial_in,
  output reg[3:0]q);
  
  always@(posedge clk)begin
    if(rst)
      q<=3'b0;
    else
      q<= {q[2:0],serial_in};
  end
endmodule
