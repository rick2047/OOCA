`timescale 1ns / 1ps

module IF_stage_tb;

	// Inputs
	reg clk;
	reg rst;
	reg load_pc;
	reg [15:0] pc_in;

	// Outputs
	wire [15:0] pc;

	// Instantiate the Unit Under Test (UUT)
	IF_stage uut (
		.clk(clk), 
		.rst(rst),
		.load_pc(load_pc),
		.pc_in(pc_in),
		.pc(pc)
	);

	always #5 clk = ~clk;
	initial begin
		load_pc = 0;
		rst = 1;
		#1;
		rst = 0;
		clk = 1;
		#99;
		
		load_pc = 1;
		pc_in = 16'hff33;
		#1;
		load_pc = 0;
		#99;
		$finish;
	end
      
endmodule

