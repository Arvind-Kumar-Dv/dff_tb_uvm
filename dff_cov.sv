class dff_cov extends uvm_subscriber#(dff_tb_tx);
`uvm_component_utils(dff_cov)
dff_tb_tx tx;
covergroup dff_cg;
DIN:coverpoint tx.din{
			option.auto_bin_max=1;
			}

endgroup

function new(string name,uvm_component parent);
	super.new(name,parent);
	dff_cg=new();
endfunction

function void write(dff_tb_tx t);
$cast(tx,t);
dff_cg.sample();
endfunction

endclass
