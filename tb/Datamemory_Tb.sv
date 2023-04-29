


module Datamemory_Tb ();
    localparam DEPTH=8; // note: the actual depth is 128 but we use 8 here for cleaner console outputs

    reg clk, rst, we0;
    // read port 0
    reg [$clog2(DEPTH)-1:0] rd_addr0;
    wire [31:0] rd_dout0;
    // write port 0
    reg [$clog2(DEPTH)-1:0] wr_addr0; // note: this value selects the word, not the byte. wr_addr0=1 -> risc-v addresses 4,5,6,7
    reg [31:0] wr_din0;
    reg [2:0] wr_strb;

    Datamemory #(.DEPTH(DEPTH)) m (
        .clk,
        .rst,
        .we0,
        .rd_addr0,
        .rd_dout0,
        .wr_addr0,
        .wr_din0,
        .wr_strb
    );

    always #5 clk = ~clk;

    initial begin
        // initialize regs to zero
        we0=1;
        clk=0;
        rst=1;
        rd_addr0= {7{1'b0}};
        wr_addr0= {7{1'b0}};
        wr_din0= 32'hAABBCCDD;
        wr_strb = {3{1'b0}};

        for (int i = 0; i<8; i=i+1) begin
            @(posedge clk);
            readAll;
            #1;
            wr_strb += 1;
            wr_addr0 += 1;
        end

        #10;
        $finish;
    end

    // prints content of all addresses
    task automatic readAll;
        for(int i=0; i<DEPTH; i=i+1) begin
            rd_addr0=i;
            $display("Address: %d Data_Hex: %8h Data_Bin: %32b", rd_addr0, rd_dout0, rd_dout0);
            //$display("%8h Address %7d", rd_dout0, rd_addr0);
            #10;
        end
        $display("----------------------------------------");

    endtask
endmodule