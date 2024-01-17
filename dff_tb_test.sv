class dff_tb_base_test extends uvm_test;
	`uvm_component_utils(dff_tb_base_test)
	`NEW_COMP
	dff_tb_env env;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	env=dff_tb_env::type_id::create("env",this);
	endfunction
	
	function void end_of_elaboration_phase(uvm_phase phase);
			super.end_of_elaboration_phase(phase);
		uvm_top.print_topology();
		$display("::::::topology_print::::::");
	endfunction
endclass

class test extends dff_tb_base_test;
`uvm_component_utils(test)
`NEW_COMP
	
	task run_phase(uvm_phase phase);
		dff_seq seq;
		seq=dff_seq::type_id::create("seq",this);
		phase.raise_objection(this);
		seq.start(env.agent.sqr);
		phase.drop_objection(this);
		phase.phase_done.set_drain_time(this,100);
	endtask

endclass
