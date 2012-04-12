`timescale 1ns / 1ps

module alu_tb;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg [2:0] cmd;
	reg cs;

	// Outputs
	wire [15:0] r;
	wire cy,z;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.cs(cs),
		.a(a), 
		.b(b), 
		.cmd(cmd),
		.r(r),
		.cy(cy),
		.z(z)
	);

	initial begin
		// Initialize Inputs
		cs = 1;
		a = 16'hff00;
		b = 16'hF0F0;
		cmd = 3'b000;
		
		#10;
		
		a = 16'h0f00;
		b = 16'hF0F0;
		cmd = 3'b000;
		
		#10;
		
		a = 16'hf0f0;
		b = 16'hF0F0;
		cmd = 3'b001;
		
		#10;
		
		$finish;
	end
      
endmodule

