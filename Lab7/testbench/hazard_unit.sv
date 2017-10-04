`include "cpu_types_pkg.vh"
`include "hazard_unit_if.vh"

module hazard_unit 
import cpu_types_pkg::*; 
(
  hazard_unit_if.hu huif
);

//flush
always_comb begin
  if (huif.jumpSel == 3) begin
    huif.flush = huif.PCSel && (huif.bne ? ~huif.zero : huif.zero);
  end else if (huif.jumpSel > 0) begin
    huif.flush = 1;
  end else begin
    huif.flush = 0;
  end
end

//freeze
always_comb begin
  huif.freeze = 0;
  if((huif.instr[31:26] == LW || huif.instr[31:26] == SW) & ~huif.dhit) begin
    if((huif.rs_d == huif.rw_m) && huif.regWEN_m) begin
      huif.freeze = 1;
    end else if((huif.rt_d == huif.rw_m) && huif.regWEN_m) begin
      huif.freeze = 1;
    end
  end
end


endmodule
