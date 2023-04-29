


module InstMem_Tb ();
    parameter initFile = "tb/instInit.txt";

    reg clk, rst, we0;
    // read port 0
    reg [6:0] rd_addr0;
    wire [31:0] rd_dout0;
    // write port 0
    reg [6:0] wr_addr0;
    reg [31:0] wr_din0;

    localparam depth = 128;
    reg [31:0] instructions [0:depth -1];

    integer idx;

    Memblock #(.WIDTH(32), .DEPTH(depth)) m (
        .clk,
        .rst,
        .we0,
        .rd_addr0,
        .rd_dout0,
        .wr_addr0,
        .wr_din0
    );

    always #5 clk = ~clk;

    initial begin
        // initialize regs to zero
        we0=1;
        rd_addr0= {7{1'b0}};
        wr_addr0= {7{1'b0}};
        wr_din0= {32{1'b1}};
    end

    initial begin
        $readmemh(initFile, instructions);
        $display("Here we just make sure that we imported the instructions from the file:");
        $display("%h\n%h\n%h\n---", instructions[0], instructions[1], instructions[2]);
        $dumpfile("waveform/InstMem_Tb.vcd");
        $dumpvars(0, InstMem_Tb);
        for (idx = 0; idx < depth; idx = idx + 1) $dumpvars(0, m.mem[idx]);

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
        $display("-----------------------------------------");
    endtask

    
endmodule
