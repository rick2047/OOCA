`timescale 1ns / 1ps

module OOCA_top_tb;

	// Inputs
	reg clk,rst;
	
	//bidirectional
	wire [15:0] porta,portb;
	
	// Instantiate the Unit Under Test (UUT)
	OOCA_top uut (
		.clk	(clk),
		.rst	(rst),
		.porta	(porta),
		.portb	(portb)
	);

	always #5 clk = ~clk;
	initial begin
	
		rst = 1;
		#1;
		rst = 0;
		clk = 1;
		#90;
		$finish;
	end

endmodule

