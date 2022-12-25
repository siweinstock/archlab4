module main;
	reg clk, reset, taken, branch;
	wire prediction;
	
	integer error_num, expected, a, b;
	
	sat_count sat_count(.clk(clk), .reset(reset), .branch(branch), .taken(taken), .prediction(prediction));
	
	initial begin
		$dumpfile("waves.vcd");
		$dumpvars;
		
		expected = 0;
		
		clk = 1;
		reset = 1;
		taken = 0;
		branch = 0;
		#5;			// 5	
		reset = 0;
		branch = 1;
		taken = 1;
		#5;			// 10
		#10;		// 20
		expected = 1;
		#30;		// 50
		reset = 1;
		expected = 0;
		#5;			// 55
		reset = 0;
		taken = 0;
		#5;			// 60
		#10;		// 70	
		expected = 0;
		#10;		// 80
		taken = 1;
		#10;		//90
		expected = 1;
		#30;		// 120
		taken = 0;
		#10;		// 130
		expected = 0;
		#10;		// 140
		taken = 1;
		expected = 1;
		#30;		// 170
		taken = 0;
		#10;		// 180
		expected = 0;
		#30;		// 210
		
		
		$finish;
	end
	
	always #5 clk = ~clk;

endmodule
