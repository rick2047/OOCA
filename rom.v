`timescale 1ns / 1ps

module rom(
    input [15:0] addr,
    input [15:0] data_in,
    input rd,
    input wr,
    input cs,
    output reg [15:0] data_out
    );

	reg [15:0] mem[65536:0];
	integer k;
	initial begin
		mem[0] = 16'h0013;
		mem[1] = 16'h1010;
		
		mem[257] = 16'd33;
		mem[513] = 16'd400;
	end
	
	always @(cs)begin
		if(wr)
			mem[addr] <= data_in;
		if(rd)
			data_out <= mem[addr];
	end
	
endmodule
