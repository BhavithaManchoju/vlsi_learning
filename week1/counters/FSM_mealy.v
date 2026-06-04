module FSM(
  input clk,
  input rst,
  input x,
  output reg z);
   
   localparam s0 = 2'b00;
   localparam s1 = 2'b01;
   localparam s2 = 2'b10;
   localparam s3 = 2'b11;
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
        next_state = s1;
      else
        next_state = s2;
      default: next_state = s0;
    endcase
  end
  always@(*)begin
    assign z = (state==s3)&& x;
  end
endmodule
    
      
      
 
