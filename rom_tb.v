`timescale 1ns / 1ps

module rom_tb;

	// Inputs
	reg [15:0] addr;
	reg [15:0] data_in;
	reg rd;
	reg wr;
	reg cs;

	// Outputs
	wire [15:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	rom uut (
		.addr(addr), 
		.data_in(data_in), 
		.rd(rd), 
		.wr(wr), 
		.cs(cs), 
		.data_out(data_out)
	);

	
	initial begin
		// Initialize Inputs
		addr = 16'd12;
		data_in = 16'd33;
		rd = 0;
		wr = 1;
		cs = 1;
		#1;
		cs = 0;
		#10;
		
      addr = 16'd12;
		data_in = 16'd33;
		rd = 1;
		wr = 0;
		cs = 1;
		#1;
		cs = 0;
		#10;
		$finish;
		// Add stimulus here

	end
      
endmodule

