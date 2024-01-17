class dff_tb_base_seq extends uvm_sequence#(dff_tb_tx);
	`uvm_object_utils(dff_tb_base_seq)
	`NEW_OBJ
	uvm_phase phase;
	dff_tb_tx tx;
	task pre_body();
		if(phase!=null) begin
			phase.raise_objection(this);
			phase.phase_done.set_drain_time(this, 50);
		end
	endtask

	task post_body();
			if(phase != null) begin
			phase.drop_objection(this);
			end
	endtask
endclass

class dff_seq extends dff_tb_base_seq;
`uvm_object_utils(dff_seq)
`NEW_OBJ
	
	task body();
			bit d_t;
			repeat(10) begin
			d_t=$random;
			`uvm_do_with(req,{req.din==d_t;})
			end
	endtask

endclass
