module imem(input   [2:0] a,
            output  [15:0] rd);

  reg [2:0] RAM[0:15];

  initial
      $readmemh("memfile.dat",RAM);

  assign rd = RAM[a]; // word aligned
endmodule