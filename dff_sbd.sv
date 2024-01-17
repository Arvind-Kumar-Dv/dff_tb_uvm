`uvm_analysis_imp_decl(_arv)
class dff_sbd extends uvm_scoreboard;
`uvm_component_utils(dff_sbd)
`NEW_COMP
dff_tb_tx tx;
uvm_analysis_imp_arv#(dff_tb_tx,dff_sbd) imp_sbd;
bit dff_Q1[$];
bit dff_Q2[$];
bit dftx1,dftx2;


		function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		imp_sbd=new("imp_sbd",this);
		endfunction

		function void write_arv(dff_tb_tx tx);
		`uvm_info("dff_SBD","dff_SBD_TX",UVM_LOW);
				dff_Q1.push_back(tx.dout);
				dff_Q2.push_back(tx.dout);
		endfunction

		task run_phase(uvm_phase phase);
			repeat(10) begin
					$display("--------------------------------------------------------------------check");
					wait(dff_Q1.size()>0 && dff_Q2.size()>0);
					dftx1=dff_Q1.pop_front();
					dftx2=dff_Q2.pop_front();
					
					if(dftx1==dftx2)begin
						$display("matching");
					end
					else begin
						$display("mismatching");
					end

					end

		endtask

	endclass
