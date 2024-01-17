class dff_tb_env extends uvm_env;
	`uvm_component_utils(dff_tb_env)
	`NEW_COMP
	dff_tb_agent agent;
	dff_sbd       sbd ;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		agent = dff_tb_agent::type_id::create("agent",this);
		sbd   =dff_sbd::type_id::create("sbd",this);
	endfunction
function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
agent.mon.ap_port.connect(sbd.imp_sbd);
endfunction

endclass
