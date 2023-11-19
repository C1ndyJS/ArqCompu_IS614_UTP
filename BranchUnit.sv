module branchUnit(brOp, Ru1, Ru2, nextPcSrc);

  input logic [4:0] brOp;
  input logic [31:0] Ru1;
  input logic [31:0] Ru2;
  output logic nextPcSrc;
  
  always @(*)begin
    
    if (brOp[4] == 1)
      nextPcSrc = 1;
    if (brOp[4:3] == 00)
      nextPcSrc = 0;
    else if (brOp[4:3] == 01) begin
      nextPcSrc = 0;
      case(brOp)
        5'b01000:
          if (Ru1 == Ru2)
            nextPcSrc = 1;
        5'b01001:
          if (Ru1 != Ru2)
            nextPcSrc = 1;
        5'b01100:
          if (Ru1 < Ru2)
            nextPcSrc = 1;
        5'b01101:
          if (Ru1 >= Ru2)
            nextPcSrc = 1;
        5'b01110:
          if (Ru1 < $unsigned(Ru2))
            nextPcSrc = 1;
        5'b01111:
          if (Ru1 >= $unsigned(Ru2))
            nextPcSrc = 1;
      endcase
    end
  end
    
endmodule

//--------------
module BranchUnit (
    input logic [31:0] operandA,       // Primer operando
    input logic [31:0] operandB,       // Segundo operando
    input logic [2:0]  branchType,     // Tipo de operación de branch
    input logic [31:0] jumpAddr,       // Dirección de salto
    output logic       takeBranch,     // Señal de salida que indica si se toma el branch
    output logic [31:0] branchTarget   // Dirección de branch objetivo
);

    always_comb begin
        takeBranch = 0; // Valor por defecto
        branchTarget = jumpAddr; // Establece la dirección de branch objetivo

        // Evalúa el tipo de operación de branch
        case(branchType)
            3'b000: // BEQ (Branch if Equal)
                if (operandA == operandB) takeBranch = 1;
            3'b001: // BNE (Branch if Not Equal)
                if (operandA != operandB) takeBranch = 1;
            3'b010: // BLT (Branch if Less Than)
                if (operandA < operandB) takeBranch = 1;
            3'b011: // BGE (Branch if Greater or Equal)
                if (operandA >= operandB) takeBranch = 1;
            3'b101: // BGE (Branch if Greater or Equal)
                if (operandA >= operandB) takeBranch = 1;
            3'b110: // BGE (Branch if Greater or Equal)
                if (operandA >= operandB) takeBranch = 1;
            // Puedes agregar más condiciones de branch si es necesario
            default:
                takeBranch = 0;
        endcase
    end

endmodule
