module maindec(input  [2:0] op,
               output       memtoreg, memwrite,
               output        branch, alusrc,
               output        regdst, regwrite,
               output        jump,
               output  [1:0] aluop);

  reg [8:0] controls;

  assign {regwrite, regdst, alusrc, branch, memwrite,
          memtoreg, jump, aluop} = controls;

  always @*
    case(op)
      3'b000: controls <= 9'b110000010; // RTYPE
      3'b001: controls <= 9'b101001000; // LW
      3'b010: controls <= 9'b001010000; // SW
      3'b011: controls <= 9'b000100001; // BEQ
      3'b100: controls <= 9'b101000000; // ADDI
      3'b101: controls <= 9'b000000100; // J
      default:   controls <= 9'bxxxxxxxxx; // illegal op
    endcase
endmodule