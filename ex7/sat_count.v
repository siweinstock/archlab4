module sat_count(clk, reset, branch, taken, prediction);
   parameter N=2;
   input clk, reset, branch, taken;
   output prediction;

   reg [1:0] state;

   always @(posedge clk) begin
     if (reset) state <= 'b0;			// reset state to 00
     else if (~branch) state <= state;		// preserve state
     else begin
       case (state)
         'b00: state <= taken ? 'b01 : 'b00;
         'b01: state <= taken ? 'b10 : 'b00;
         'b10: state <= taken ? 'b11 : 'b01;
         'b11: state <= taken ? 'b11 : 'b10;
         default: state <= 'bxx;        // should never get here code 
       endcase
     end
   end
   
   assign prediction = state[1];

endmodule
