module mod_10(
    input clk,
    input rst,
  output reg [3:0] count
);

  always @(posedge clk) begin
    if (rst)
        count <= 4'b0;
    else if (count==9)
        count <= 4'b0;
    else
      count<= count+1;
end

endmodule
