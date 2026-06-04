module up_down_counter(
    input clk,
    input rst,
    input up,
  output reg [3:0] count
);

  always @(posedge clk) begin
    if (rst)
        count <= 4'b0;
   
    else if (up)
      count<= count+1;
    else
       count<=count-1;
end

endmodule
