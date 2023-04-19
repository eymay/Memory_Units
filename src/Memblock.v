module Memblock (
	clk,
	rst,
	rd_addr0,
	wr_addr0,
	wr_din0,
	we0,
	rd_dout0
);
	parameter WIDTH = 1;
	parameter DEPTH = 1;
	input wire clk;
	input wire rst;
	input wire we0;
	input wire [$clog2(DEPTH) - 1:0] rd_addr0;
	output wire [WIDTH - 1:0] rd_dout0;
	input wire [$clog2(DEPTH) - 1:0] wr_addr0;
	input wire [WIDTH - 1:0] wr_din0;
	reg [WIDTH - 1:0] mem [0:DEPTH - 1];
	initial begin : sv2v_autoblock_1
		integer i;
		for (i = 0; i < DEPTH; i = i + 1)
			mem[i] = {WIDTH {1'b0}};
	end
	always @(posedge clk or rst)
		if (we0 && rst)
			mem[wr_addr0] = wr_din0;
	always @(*)
		if (!rst) begin : sv2v_autoblock_2
			integer i;
			for (i = 0; i < DEPTH; i = i + 1)
				mem[i] <= {WIDTH {1'b0}};
		end
	assign rd_dout0 = mem[rd_addr0];
	task automatic printAll;
		begin
			$display("Content of memory unit (width=%0d, depth=%0d, time=%0d):", WIDTH, DEPTH, $time);
			begin : sv2v_autoblock_3
				integer i;
				for (i = 0; i < DEPTH; i = i + 1)
					$display("addr %7d: data %32b", i, mem[i]);
			end
			$display("----------------------------------------");
		end
	endtask
endmodule
