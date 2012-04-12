`timescale 1ns / 1ps

module obj_ref(
    input [3:0] obj_ptr,
	 input [7:0] mem_ptr,
    input clk,
	 input rd,
	 input wr,
	 input [15:0] obj_loc_in,
    output reg [15:0] obj_loc
    );

	reg [15:0] obj[7:0];

	initial begin
		obj[0] = 16'h0100;
		obj[1] = 16'h0200;
		obj[2] = 16'h0300;
		obj[3] = 16'h0400;
		obj[4] = 16'h0500;
		obj[5] = 16'h0600;
		obj[6] = 16'h0700;
		obj[7] = 16'h0800;
	end
	
	always @(posedge clk) begin
		if(rd)
			obj_loc <= (obj[obj_ptr]+mem_ptr);
		else
			obj[obj_ptr] <= obj_loc_in;
	end
	
endmodule
