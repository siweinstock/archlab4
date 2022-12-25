module fulladder( sum, co, a, b, ci);

  input   a, b, ci;
  output  sum, co;

  reg co, sum;

  always @(a or b or ci) begin
    {co, sum} = a + b + ci;
  end

endmodule
