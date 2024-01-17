`include "uvm_pkg.sv"
 import uvm_pkg::*;

`include "dff_slv.v"
`include "dff_tb_common.sv"
`include "dff_tb_interface.sv"
`include "dff_tb_tx.sv"
`include "dff_tb_sequence.sv"
`include "dff_cov.sv"
`include "dff_mon.sv"
`include "dff_tb_sequencer.sv"
`include "dff_tb_driver.sv"
`include "dff_tb_agent.sv"
`include "dff_sbd.sv"
`include "dff_tb_env.sv"
`include "dff_tb_test.sv"

module dff_tb_top();
	reg clk,rst;
	
	dff_tb_intf pif(clk,rst);
	
	dff_slv dut (
		
		.clk (pif.clk),
		.rst (pif.rst),
		.din (pif.din),
		.dout(pif.dout)
			);

initial begin
	clk=0;
	forever #5 clk=~clk;
end

initial begin
uvm_config_db#(virtual dff_tb_intf)::set(uvm_root::get(),"*","dff_vif",pif);
end

initial begin
	rst=1;
	repeat(2)@(posedge clk);
	rst=0;
end
		initial begin
			run_test("test");
		end

endmodule
