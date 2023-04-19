module Regfile (
	clk,
	rst,
	rd_addr0,
	rd_addr1,
	wr_addr0,
	wr_din0,
	we0,
	rd_dout0,
	rd_dout1
);
	parameter WIDTH = 32;
	parameter DEPTH = 32;
	input wire clk;
	input wire rst;
	input wire we0;
	input wire [$clog2(DEPTH) - 1:0] rd_addr0;
	output wire [WIDTH - 1:0] rd_dout0;
	input wire [$clog2(DEPTH) - 1:0] rd_addr1;
	output wire [WIDTH - 1:0] rd_dout1;
	input wire [$clog2(DEPTH) - 1:0] wr_addr0;
	input wire [WIDTH - 1:0] wr_din0;
	reg [WIDTH - 1:0] mem [0:DEPTH - 1];
	always @(posedge clk)
		if ((we0 && rst) && wr_addr0)
			mem[wr_addr0] = wr_din0;
	always @(*) begin
		if (!rst) begin : sv2v_autoblock_1
			integer i;
			for (i = 1; i < DEPTH; i = i + 1)
				mem[i] = {WIDTH {1'b0}};
		end
		mem[0] = {WIDTH {1'b0}};
	end
	assign rd_dout0 = mem[rd_addr0];
	assign rd_dout1 = mem[rd_addr1];
endmodule
