module main;
   reg clk, reset, push, pop;
   reg [1:0] in;
   wire [1:0] out;
   wire full;

   // Correct the parameter assignment
   fifo #(4,2) fifo(clk, reset, in, push, pop, out, full);

   always #5 clk = ~clk;

   // Fill Here
  initial begin
    $monitor("time=%d: reset=%b, in=%b, out=%b, push=%b, pop=%b, full=%b\n", $time, reset, in, out, push, pop, full);
    $dumpfile("waves.vcd");
    $dumpvars;
   
    clk = 1;
    reset = 1;
    pop = 0;
    push = 0;
    in = 2'b11;
    #10;
    reset = 0;
    #10;
    push = 1;
    #10;
    in = 2'b10;
    #10;
    in = 2'b11;
    #10;
    in = 2'b00;
    #10;
    in = 2'b11;
    #20;
    push = 0;
    pop = 1;
    #50;
    push = 1;
    pop = 1;
    #10;
    pop = 0;
    in = 2'b10;
    #10;
    in = 2'b01;
    #10;
    in = 2'b00;
    #10;
    pop = 1;
    in = 2'b11;
    #10;
    in = 2'b10;
    #10;
    in = 2'b01;
    #10;
    #10;


    $finish;
  end
   
   
endmodule

