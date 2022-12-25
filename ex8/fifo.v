module fifo(clk, reset, in, push, pop, out, full);
	parameter N=4; // determines the maximum number of words in queue.
	parameter M=2; // determines the bit-width of each word, stored in the queue.

	input clk, reset, push, pop;
	input [M-1:0] in;
	output reg [M-1:0] out;
	output full;
	
	reg [M-1:0] DATA[N-1:0];
	reg [$clog2(N):0] head = 0;
	reg [$clog2(N):0] tail = 0;
	reg [$clog2(N):0] n = 0;
	
	integer i;

   
	always @(posedge clk) begin
		// reset set everything to zero
		if (reset) begin
			head <= 'b0;
			tail <= 'b0;
			n <= 'b0;
			out <= 'b0;
			
			for (i=0; i<N; i=i+1) begin
				DATA[i] <= 'b0;
			end
		end
		else begin
			out <= DATA[tail];
		
			case ({push, pop})
				// push
				2'b10: begin
					// allow only if not full
					if (~full) begin
						DATA[head] <= in;
						head <= (head + 1) & (N-1);	// cyclic pointer
						n <= n + 1;
					end
				end
				// pop
				2'b01: begin
					// allow only if not empty
					if (n > 0) begin
						DATA[tail] <= 'b0;
						tail <= (tail + 1) & (N-1);	// cyclic pointer
						n <= n - 1;
					end
				end
				// push & pop
				2'b11: begin
					DATA[head] <= in;
					head <= (head + 1) & (N-1);	// cyclic pointer
					//out <= DATA[tail];
					if (n > 0) begin	// do pop
						DATA[tail] <= 'b0;
						tail <= (tail + 1) & (N-1);	// cyclic pointer
					end
					else begin	// don't do pop
						n <= n + 1;
					end
				end
			
			endcase
		end
		   
	end
	
	assign full = (n == N) ? 1 : 0; 
   
endmodule

