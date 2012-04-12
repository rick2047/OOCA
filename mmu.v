`timescale 1ns / 1ps

module mmu(
    input [1:0] addr[15:0],// 0 - PC, 1 - data to read
    input sel,
    output [15:0] memory_address;
    );
	
	assign memory_address = addr[sel];	
endmodule
