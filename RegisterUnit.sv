module regunit(rs1, rs2, rd, rudw, ruwr, clk, ru1, ru2);

  input logic [4:0] rs1;
  input logic [4:0] rs2;
  input logic [4:0] rd;
  input logic [31:0] rudw;
  input logic ruwr;
  input logic clk;
  output logic [31:0] ru1;
  output logic [31:0] ru2;
  
  reg [7:0] mem[0:1023];
  
  initial begin
    $readmemh("reg_file.hex", mem);
  end
  reg [7:0] addr1;
  reg [7:0] addr2;
  reg [7:0] addrd;
  assign addr1 = rs1 * 5'b00100;
  assign addr2 = rs2 * 5'b00100;
  assign addrd = rd * 5'b00100;
  
  always @(*)
    if (clk == 1)
      begin
        ru1 <= {mem[addr1+3], mem[addr1+2], mem[addr1+1], mem[addr1]};
        ru2 <= {mem[addr2+3], mem[addr2+2], mem[addr2+1], mem[addr2]};
      end
  
  always @(negedge clk)
    begin
      if (rd != 5'b0 && ruwr == 1) begin
        mem[addrd] <= rudw[7:0];
        mem[addrd+1] <= rudw[15:8];
        mem[addrd+2] <= rudw[23:16];
        mem[addrd+3] <= rudw[31:24];
      end
    end
endmodule


//Esteban 

//-------------------
module RegisterFile (
    input logic clk,            
    input logic rst,            
    input logic we,             
    input logic [4:0] wrAddr,   
    input logic [4:0] rdAddr1,  
    input logic [4:0] rdAddr2,  
    input logic [31:0] wrData,  
    output logic [31:0] rdData1,
    output logic [31:0] rdData2 
);

// Declare 32 registers in which to store the data, each one will have a size of 32 bits.
logic [31:0] regFile [31:0];

// Write Operation
// An "always_ff" cycle is used since operations are expected to be updated only with the clock or reset signal.
 

endmodule