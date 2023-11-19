
 * Módulo ALU (Unidad Lógico-Aritmética)
 * Este módulo realiza operaciones aritméticas y lógicas según la señal de control aluOp.
 * Soporta múltiples operaciones básicas sobre los operandos ASrc y BSrc.
 * Parámetros:
 *   - ASrc: Entrada de datos de 32 bits para el primer operando.
 *   - BSrc: Entrada de datos de 32 bits para el segundo operando.
 *   - aluOp: Señal de control de 4 bits que selecciona la operación a realizar.
 *   - alures: Salida de datos de 32 bits que contiene el resultado de la operación.
 