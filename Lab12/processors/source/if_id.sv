`include "cpu_types_pkg.vh"
`include "if_id_if.vh"

module if_id
(
	input logic CLK,
	input logic nRST,
	if_id_if.if_id ifid_if
);


import cpu_types_pkg::*;

always_ff @(posedge CLK, negedge nRST) begin
	if (nRST == 1'b0) begin	
		ifid_if.next_pc_o <= 0;
		ifid_if.instr_o <= 0;
	end
	else begin
		if (ifid_if.ihit == 1'b1 && ifid_if.flush == 1'b1) begin
			ifid_if.next_pc_o <= 0;
			ifid_if.instr_o <= 0;
		end
		else if (ifid_if.ihit == 1'b1 && ifid_if.freeze == 1'b0) begin
			ifid_if.next_pc_o <= ifid_if.next_pc_i;
			ifid_if.instr_o <= ifid_if.instr_i;
			
		end
	end

end

endmodule 