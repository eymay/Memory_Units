module Regfile_tb();

   localparam depth = 32;
   localparam width = 32;
   localparam initFile = "tb/instInit.txt";

   reg clk, rst, we0;
    // read port 0
    reg [$clog2(depth)-1:0] rd_addr0;
    wire [width-1:0] rd_dout0;
    // read port 1
    reg [$clog2(depth)-1:0] rd_addr1;
    wire [width-1:0] rd_dout1;
    // write port 0
    reg [$clog2(depth)-1:0] wr_addr0;
    reg [width-1:0] wr_din0;

    integer idx;

    reg [width:0] instructions [0:depth -1];

    Regfile #(.WIDTH(width), .DEPTH(depth)) rf (
        .clk,
        .rst,
        .we0,
        .rd_addr0,
        .rd_dout0,
        .rd_addr1,
        .rd_dout1,
        .wr_addr0,
        .wr_din0
    );

    always #5 clk = ~clk;

    initial begin
        // initialize regs to zero
        we0=1;
        rd_addr0= {7{1'b0}};
        rd_addr1= {7{1'b0}};
        wr_addr0= {7{1'b0}};
        wr_din0= {32{1'b1}};
    end

    initial begin
        $readmemh(initFile, instructions);
        $display("%h\n%h\n%h", instructions[0], instructions[1], instructions[2]);
        $dumpfile("waveform/Regfile_tb.vcd");
        $dumpvars(0, Regfile_tb);
        for (idx = 0; idx < depth; idx = idx + 1) $dumpvars(0, rf.mem[idx]);

        clk=0;
        wr_din0= {32{1'b1}};
        we0=1;
        rst=1;
        #6;
        //rst signal resets the memory asynchronously
        rst=0; // low active, so keep at 1
        #10;
        rst=1; // low active, so keep at 1
        we0=0;
        writeAll;
        readAll;
        we0=1;
        writeAll;
        readAll;
        //rd_dout0 reads data asynchronously
        rd_addr0=8;

        #10;
        $finish;
    end

    task automatic writeAll;
        for(int i=0; i<depth; i=i+1) begin
            wr_addr0=i;
            wr_din0=instructions[i];
            #10;
        end
    endtask

        // prints content of all addresses
    task automatic readAll;
        for(int i=0; i<depth; i=i+1) begin
            rd_addr0=i;
            $display("Address: %d Data_Hex: %8h Data_Bin: %32b", rd_addr0, rd_dout0, rd_dout0);
            #10;
        end
    endtask

    // prints content of all addresses
    task automatic printAll;
        $display("Content of memory unit (width=%0d, depth=%0d, time=%0d):", width, depth, $time);
        for (integer i = 0; i<depth; i=i+1) begin
            $display("addr %7d: data %32b", i, rf.mem[i]);
        end
        $display("----------------------------------------");
    endtask

endmodule;
