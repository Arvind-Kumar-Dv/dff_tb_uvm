class dff_tb_driver extends uvm_driver#(dff_tb_tx);
	`uvm_component_utils(dff_tb_driver)
	dff_tb_tx tx;
	`NEW_COMP
	
	virtual dff_tb_intf vif;
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		uvm_config_db#(virtual dff_tb_intf)::get(this,"","dff_vif",vif);
	endfunction

	task run_phase(uvm_phase phase);
		forever begin
			seq_item_port.get_next_item(req);
			drive_tx(req);
		//	req.print();
			seq_item_port.item_done();
		end
	endtask

	task drive_tx(dff_tb_tx tx);
			//@(vif.drv_cb);
			@(posedge vif.clk);
			vif.din=tx.din;
			@(posedge vif.clk);
			//@(vif.drv_cb);
			vif.din <=0;
	endtask

endclass
