`timescale 1ns / 1ps
`include "mips_16_defs.v"

module OOCA_top(clk,rst,porta,portb
    );
	 

	input clk;
	input rst;
	output [15:0] porta,portb;
	
	wire [15:0] porta,portb;
	wire [15:0] pc;
	wire [15:0] fetched_inst;
	wire [15:0] pc_in;
	wire load_pc;
	wire cs = 1;
	
	wire [15:0] data_loc;
	wire [15:0] data;
	wire z,cy;
	wire [15:0] r;
	
	reg give_to=1;//1=alu_a, 0 = alu_b
	reg [15:0] alu_a,alu_b,alu_r;
	reg [15:0] flag = 16'h0000;
	
	IF_stage IF_stage_inst(
		.clk(clk), 
		.rst(rst),
		.load_pc(load_pc),
		.pc_in(pc_in),
		.pc(pc)
	);
	
	rom rom_inst(
	.addr (pc),
	.data_in (16'h0000),
	.rd (1'b1),
	.wr (1'b0),
	.cs (clk),
	.data_out (fetched_inst)
	);


	rom rom_data(
	.addr	(data_loc),
	.data_in (16'h0000),
	.rd (1'b1),
	.wr (1'b0),
	.cs (clk),
	.data_out (data)
	);
	
	obj_ref obj_ref_inst(
	.obj_ptr(fetched_inst[15:12]),
	.mem_ptr(fetched_inst[11:4]),
	.clk(clk),
	.rd(1'b1),
	.wr(1'b0),
	.obj_loc_in(16'h0000),
	.obj_loc(data_loc)
	);
	
	alu alu_inst(
		.clk(clk),
		.a(alu_a),
		.b(alu_b),
		.cmd(`ALU_ADD),
		.r(r),
		.cy(cy),
		.z(z)
	);

	always @(posedge clk)
	begin
		if(give_to)
			alu_a = data;
		else
			alu_b = data;
		give_to = ~give_to;
		flag[1:0] = {z,cy};
		alu_r = r;
		
	end
endmodule
