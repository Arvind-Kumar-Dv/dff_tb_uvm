class dff_mon extends uvm_monitor;
`uvm_component_utils(dff_mon)
`NEW_COMP
virtual dff_tb_intf vif;
uvm_analysis_port#(dff_tb_tx)ap_port;
dff_tb_tx tx;

function void build_phase(uvm_phase phase);
super.build_phase(phase);
ap_port=new("ap_port",this);
uvm_config_db#(virtual dff_tb_intf)::get(this,"","dff_vif",vif);
endfunction

task run_phase(uvm_phase phase);
		$display("monitor display outside forever loop");
		//forever begin
		repeat(10) begin
		//	@(vif.mon_cb)
			@(posedge vif.clk);
			tx=new();
			tx.din =vif.din;
			tx.dout =vif.dout;
			ap_port.write(tx);
			tx.print();
		end

endtask

endclass
