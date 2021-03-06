`include "cpu_types_pkg.vh"
`include "mem_wb_if.vh"

module mem_wb
(
	input logic CLK,
	input logic nRST,
	mem_wb_if.mem_wb memwb_if
);


import cpu_types_pkg::*;

always_ff @(posedge CLK, negedge nRST) begin
	if (nRST == 1'b0) begin
                memwb_if.RegDest_o <= 0; 
                memwb_if.regWEN_o  <= 0;
                memwb_if.instr_o <= 0;
		memwb_if.next_pc_o <= 0; 
                memwb_if.jal_o <= 0; 
                memwb_if.lui_o <= 0; 
                memwb_if.dmemload_o <= 0; 
                memwb_if.imm_o <= 0; 
                memwb_if.out_o <= 0;
                memwb_if.imemREN_o <= 1; 
                memwb_if.memToReg_o <= 0; 
                memwb_if.halt_o <= 0; 
                memwb_if.rd_o <= 0; 
                memwb_if.rt_o <= 0; 
	end
	else begin
		if (memwb_if.dhit == 1'b1 || memwb_if.ihit == 1'b1) begin
			memwb_if.RegDest_o <= memwb_if.RegDest_i; 
		        memwb_if.regWEN_o  <= memwb_if.regWEN_i;
		        memwb_if.instr_o <= memwb_if.instr_i;
			memwb_if.next_pc_o <= memwb_if.next_pc_i; 
		        memwb_if.jal_o <= memwb_if.jal_i; 
		        memwb_if.lui_o <= memwb_if.lui_i; 
		        memwb_if.dmemload_o <= memwb_if.dmemload_i; 
		        memwb_if.imm_o <= memwb_if.imm_i; 
		        memwb_if.out_o <= memwb_if.out_i;
		        memwb_if.imemREN_o <= memwb_if.imemREN_i; 
		        memwb_if.memToReg_o <= memwb_if.memToReg_i; 
		        memwb_if.halt_o <= memwb_if.halt_i; 
		        memwb_if.rd_o <= memwb_if.rd_i; 
		        memwb_if.rt_o <= memwb_if.rt_i; 
		end
	end

end

endmodule


