class dff_tb_tx extends uvm_sequence_item;
rand bit din;
	 bit dout;
	`uvm_object_utils_begin(dff_tb_tx)
		`uvm_field_int(din,  UVM_ALL_ON)
		`uvm_field_int(dout, UVM_ALL_ON)
	`uvm_object_utils_end

`NEW_OBJ

endclass
