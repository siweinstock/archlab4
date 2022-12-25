module main;
  reg A, B, CI;
  wire SUM, CO;
  
  fulladder fa(SUM, CO, A, B, CI);

  initial begin
    $monitor("time=%d:sum = %b + %b + %b = %b, co = %b\n", $time, A, B, CI, SUM, CO);
    $dumpfile("waves.vcd");
    $dumpvars;
    A = 0; B = 0; CI = 0;
    #5
    A = 0; B = 0; CI = 1;
    #5
    A = 0; B = 1; CI = 0;
    #5
    A = 0; B = 1; CI = 1;
    #5
    A = 1; B = 0; CI = 0;
    #5
    A = 1; B = 0; CI = 1;
    #5
    A = 1; B = 1; CI = 0;
    #5
    A = 1; B = 1; CI = 1;
    #5
    $finish;
  end
endmodule
