class dff_tb_agent extends uvm_agent;
	`uvm_component_utils(dff_tb_agent)
	`NEW_COMP
	dff_tb_driver drv;
	dff_tb_sqr sqr;
	dff_mon mon;
	dff_cov cov;
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		sqr = dff_tb_sqr::type_id::create("sqr",this);
		drv = dff_tb_driver::type_id::create("drv",this);
		mon = dff_mon::type_id::create("mon",this);
		cov = dff_cov::type_id::create("cov",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		drv.seq_item_port.connect(sqr.seq_item_export);
		mon.ap_port.connect(cov.analysis_export);
	endfunction

endclass
