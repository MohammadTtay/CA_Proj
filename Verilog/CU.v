`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:24:06 05/06/2022 
// Design Name: 
// Module Name:    CU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CU(in, reg_dest, reg_write, alu_src, ext_op, mem_to_reg, mem_write, branch
    );
 input [2:0] in;
  
  output reg reg_dest;
  output reg reg_write;
  output reg alu_src;
  output reg ext_op;
  output reg mem_to_reg;
  output reg mem_write;
  output reg branch;
  
  reg rtype;
  reg lw;
  reg sw;
  reg beq;
  
  always @(*)
		begin
			case(in)
			
			3'b000:	begin
			rtype = 1;
			lw = 0;
			sw = 0;
			beq = 0;	end

			3'b100:	begin
			rtype = 0;
			lw = 1;
			sw = 0;
			beq = 0;	end

			3'b010:	begin
			rtype = 0;
			lw = 0;
			sw = 1;
			beq = 0;	end
		
			3'b110:	begin
			rtype = 0;
			lw = 0;
			sw = 0;
			beq = 1;	end

			endcase
  
		reg_dest = rtype;
		reg_write = rtype | lw;
		alu_src = lw | sw;
		ext_op = lw | sw;
		mem_to_reg = lw;
		mem_write = sw;
		branch = beq;
  
  
		end

endmodule
