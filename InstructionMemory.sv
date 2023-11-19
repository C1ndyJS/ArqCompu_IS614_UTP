module instMem(address, inst);

  input logic [31:0] address;
  output logic [31:0] inst;

  logic [7:0] mem[300:0];
  
  initial begin
    $readmemh("data.hex", mem);
  end
  
  always @(*)
    inst = {mem[address+3],mem[address+2],mem[address+1],mem[address]};
endmodule

