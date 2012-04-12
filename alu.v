/***************************************************
 * Module: alu
 * Project: mips_16
 * Author: fzy
 * Description: 
 *     alu implementation
 *
 * Revise history:
 *     
 ***************************************************/
`timescale 1ns/1ps
`include "mips_16_defs.v"
module alu
(
	input					clk,	//enable alu chip
	input		[15:0]	a,		//src1
	input		[15:0]	b,		//src2
	input		[2:0]	cmd,	//function sel
	
	output	reg	[15:0]	r,		//result
	output reg cy,		//Carry bit
	output z		//Zero bit
);
	always @(clk) begin
		case(cmd)
			`ALU_NC	:
				r = 16'bx;
			`ALU_ADD:
				{cy,r} = a + b;
			`ALU_SUB:
				{cy,r} = a - b;
			`ALU_AND:
				r = a & b;
			`ALU_OR	:
				r = a | b;
			`ALU_XOR:
				r = a ^ b;
			`ALU_SL	:
				r = a << b;
			`ALU_SR	:
				r = {{16{a[15]}},a} >> b;
			`ALU_SRU	:
				r = {16'b0,a} >> b;
		endcase
	end
	
	assign z = !(|r);
	
endmodule 