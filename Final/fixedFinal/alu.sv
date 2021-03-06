module alu(input logic   [7:0] a, b,
           input logic  [2:0]  alucontrol,
           output logic [7:0] result,
           output  logic       zero);

  logic [7:0] condinvb, sum;

  assign condinvb = alucontrol[2] ? ~b : b;
  assign sum = a + condinvb + alucontrol[2];

  always @*
    case (alucontrol[1:0])
      2'b00: result = a & b;
      2'b01: result = a | b;
      2'b10: result = sum;
      2'b11: result = sum[7];
    endcase

  assign zero = (result == 8'b0);
endmodule