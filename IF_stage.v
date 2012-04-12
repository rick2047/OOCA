`timescale 1ns / 1ps

module IF_stage(
	 //input cs,
    input clk,					//clock
    input rst,					//Reset the pc
	 input load_pc,			//Load new pc value
	 input [15:0] pc_in,		//new pc value
    output reg [15:0] pc	//current pc
    );

	//pc control
	always @(posedge clk or posedge rst or posedge load_pc)
	begin
		//if(cs)begin
			if(rst)
				pc <= 16'hFFFF;
			else if(load_pc)
				pc <= pc_in;
			else if(clk)
				pc <= pc+1;
		//end
	end
	
endmodule
