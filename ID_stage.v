`timescale 1ns / 1ps

module ID_stage(
    input [3:0] op,
    input clk,
	 output reg alu_en,
    output reg [2:0] alu_op
    );
	
	reg next_op_required = 0;
	always @(posedge clk)begin
		case(op)begin
			`OP_NOP:
			begin
				alu_en = 0;
				IF_enable = 1;
			end
				
			`OP_ADD:
			begin
				if(!next_op_required)begin
					//IF_enable = 0;
					alu_en = 0;
					alu_op = `ALU_ADD;
					
					
		endcase
	end

endmodule
