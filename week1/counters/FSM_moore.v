module FSM_moore(
  input clk,
  input rst,
  input x,
  output reg z);
   
   localparam s0 = 3'b000;
   localparam s1 = 3'b001;
   localparam s2 = 3'b010;
   localparam s3 = 3'b011;
   localparam s4 = 3'b100;
  reg[1:0] state, next_state;
  always@(posedge clk)begin
    if(rst)
      state<= s0;
    else
      state<= next_state;
  end
  always@(*)begin
    case(state)
      s0: if(x)
        next_state = s1;
      else
        next_state = s0;
      s1: if(x)
        next_state = s1;
      else
        next_state = s2;
      s2: if(x)
        next_state = s3;
      else
        next_state = s0;
      s3: if(x)
        next_state = s4;
      else
        next_state = s2;
      s4: if(x)
        next_state = s1;
      else 
        next_state = s2;
      default: next_state = s0;
    endcase
  end
  always@(*)begin
    if(state=s4)
      z=1'b1;
    else
      z=1'b0;
  end
endmodule
