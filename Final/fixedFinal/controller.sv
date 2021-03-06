`include "maindec.sv"
`include "aludec.sv"
module controller(input logic  [2:0] op, 
                  input  logic [3:0] funct,
                  input  logic       zero,
                  output logic       memtoreg, memwrite,
                  output  logic       pcsrc, alusrc,
                  output logic       regdst, regwrite,
                  output logic       jump,
                  output logic [2:0] alucontrol);

    logic [1:0] aluop;
    logic branch;

  maindec md(op, memtoreg, memwrite, branch,
             alusrc, regdst, regwrite, jump, aluop);
  aludec  ad(funct, aluop, alucontrol);

  assign pcsrc = branch & zero;
endmodule