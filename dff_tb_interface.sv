interface dff_tb_intf(input bit clk,rst);
		bit din;
		bit dout;


property rst_check;
@(posedge clk) (rst) |=> (dout==0);

endproperty

property in_out;
@(posedge clk) (din==1) |=> (dout==1);

endproperty

property out_put;
@(posedge clk) (!din) |=> (dout==0);

endproperty

A:assert property (rst_check);
B:assert property (in_out);
C:assert property (out_put);

endinterface
