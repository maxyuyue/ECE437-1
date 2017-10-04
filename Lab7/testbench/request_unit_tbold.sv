// mapped needs this
`include "request_unit_if.vh"
`include "cpu_types_pkg.vh"



// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module request_unit_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  request_unit_if ruif();

  // test program
  test PROG (CLK, nRST, ruif);
  request_unit DUT (CLK, nRST, ruif);

endmodule

program test (input logic CLK, output logic nRST, request_unit_if.tb ruif);
	int test_case_cnt = 0;
	import cpu_types_pkg::*;
initial begin
	nRST = 1'b1;
	ruif.memREN = 1'b1;
	
	@(posedge CLK);

	ruif.dhit = 1'b1;

	@(posedge CLK);

	ruif.memREN = 1;
	ruif.memWEN = 1;

	@(posedge CLK);
	
	ruif.ihit = 1'b1;
	
	@(posedge CLK);

	
end	

endprogram