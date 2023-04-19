


module InstMem_Tb ();
    parameter initFile = "instInit.txt";

    reg clk, rst, we0;
    // read port 0
    reg [6:0] rd_addr0;
    wire [31:0] rd_dout0;
    // write port 0
    reg [6:0] wr_addr0;
    reg [31:0] wr_din0;

    reg [31:0] instructions [0:2];


    Memblock #(.WIDTH(32), .DEPTH(128)) m (
        .clk(clk),
        .rst(rst),
        .we0(we0),
        .rd_addr0(rd_addr0),
        .rd_dout0(rd_dout0),
        .wr_addr0(wr_addr0),
        .wr_din0(wr_din0)
    );

    

    always begin
        #9 clk = ~clk;
        #1 clk = ~clk;
    end

    initial begin
        // initialize regs to zero
        clk=0;
        rst=1; // low active, so keep at 1
        we0=0;
        rd_addr0= {7{1'b0}};
        wr_addr0= {7{1'b0}};
        wr_din0= {32{1'b0}};
    end

    initial begin
        #20 $finish;
    end

    initial begin
        $readmemb(initFile, instructions);
        $display("%h\n%h\n%h", instructions[0], instructions[1], instructions[2]);
    end

    
endmodule