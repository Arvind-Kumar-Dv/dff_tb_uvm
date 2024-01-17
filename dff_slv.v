module dff_slv(clk,rst,din,dout);
input clk,rst,din;
output reg dout;
	always@(posedge clk) begin
			if(rst==1) begin
				dout<=1'b0;
			end
			else begin
				dout<=din;
			end
	end
endmodule
