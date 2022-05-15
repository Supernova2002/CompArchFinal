`include "controller.v"
`include "datapath.v"
module mips(input          clk, reset,
            output  [15:0] pc,
            input   [15:0] instr,
            output         memwrite,
            output  [7:0] aluout, writedata,
            input   [7:0] readdata);

wire      memtoreg, alusrc, regdst, 
              regwrite, jump, pcsrc, zero;
wire [2:0] alucontrol;

controller c(instr[15:13], instr[3:0], zero,
               memtoreg, memwrite, pcsrc,
               alusrc, regdst, regwrite, jump,
               alucontrol);
datapath dp(clk, reset, memtoreg, pcsrc,
              alusrc, regdst, regwrite, jump,
              alucontrol,
              zero, pc, instr,
              aluout, writedata, readdata);

endmodule