`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:16:12 05/06/2022 
// Design Name: 
// Module Name:    ALU_Ctrl 
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
module ALU_Ctrl(lw, sw, beq, funct, rtype, alu_ctrl
    );
	 
	reg [2:0] in;
	input sw;
	input beq;
	input lw;
	input rtype;
	input [3:0] funct;
	output reg [2:0] alu_ctrl;
	
  always @(*)
		begin
  
		in[0] = ~beq;
		in[1] = sw | lw;
		in[2] = beq;
  
		if(rtype)
			begin
			alu_ctrl = in; end
			
		else begin
			
		alu_ctrl[0] = funct[0];
		alu_ctrl[1] = funct[1];
		alu_ctrl[2] = funct[2]; end
		
  
		end

endmodule
