
`include "control_unit_if.vh"
`timescale 1 ns / 1 ns
import cpu_types_pkg::*;

module control_unit_tb;
  // interface
  control_unit_if cuif ();
  // test program
  test PROG ();
  // DUT
`ifndef MAPPED
  control_unit DUT(cuif);
`else
  control_unit DUT (
	.\cuif.instr (cuif.instr),
	.\cuif.PCSel (cuif.PCSel),
	.\cuif.memtoReg (cuif.memtoReg),
	.\cuif.regWEN (cuif.regWEN),
	.\cuif.jal (cuif.jal), //5
	.\cuif.halt (cuif.halt),
	.\cuif.dWEN (cuif.dWEN),
	.\cuif.dREN (cuif.dREN),
	.\cuif.imemREN (cuif.imemREN),
	.\cuif.lui (cuif.lui), //10
	.\cuif.bne (cuif.bne),
	.\cuif.ALUSel (cuif.ALUSe),
	.\cuif.RegDest (cuif.RegDest),
	.\cuif.JumpSel (cuif.JumpSel),
	.\cuif.aluop (cuif.aluop), //15
	.\cuif.rs (cuif.rs),
	.\cuif.rt (cuif.rt),
	.\cuif.rd (cuif.rd),
	.\cuif.imm (cuif.imm),
	.\cuif.shamt (cuif.shamt) //20 clear
  );
`endif
endmodule

program test;
  initial begin
  control_unit_tb.cuif.instr = 32'h340000F0;
  #(10);
  control_unit_tb.cuif.instr = 32'h3402BEEF;
  #(10);
  control_unit_tb.cuif.instr = 32'h3802DEAD;
  #(10);
  control_unit_tb.cuif.instr = 32'hDEADBEEF;
  #(10);
  control_unit_tb.cuif.instr = 32'hBAD1BAD1;
  #(10);
  $finish;
  end
endprogram
