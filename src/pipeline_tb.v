`timescale 1ns / 1ps  // 1. Required by Vivado to define time units and precision

module tb();

    reg clk = 0; 
    reg rst;
    
    // 2. Standardized clock generation. 
    // The previous format (clk = ~clk; #50;) can cause zero-delay infinite loops in some simulator configurations.
    always #50 clk = ~clk; 

    initial begin
        // 3. Changed to blocking assignments (=). 
        // Testbench stimulus should generally use blocking assignments to execute sequentially.
        rst = 1'b0;
        #200;
        rst = 1'b1;
        #1000;
        $finish;    
    end

    // 4. Waveform Dumping (Optional for Vivado)
    // Vivado XSim automatically generates its own waveform database (.wdb) if run in the GUI.
    // Leaving these VCD commands in is perfectly fine, but they aren't required to view waves in Vivado.
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb); // Best practice: explicitly pass the module name to dumpvars
    end

    Pipeline_top dut (
        .clk(clk), 
        .rst(rst)
    );
    
endmodule