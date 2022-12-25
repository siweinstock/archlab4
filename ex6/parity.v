module parity(clk, in, reset, out);

   input clk, in, reset;
   output out;

   reg 	  out;
   reg 	  state;

   localparam zero=0, one=1;

   always @(posedge clk)
     begin
	if (reset)
	  state <= zero;
	else
	  case (state)
	    zero: state <= in ? one : zero;
	    one: state <= in ? zero: one;
	    default: state <= 'bx;
	  endcase
     end

   always @(state) 
     begin
	case (state)
	    zero: assign out = 1;
	    one: assign out = 0;
	    default: assign out = 'bx;
	endcase
     end

endmodule
