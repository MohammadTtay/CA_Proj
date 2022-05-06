`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:26:31 05/06/2022 
// Design Name: 
// Module Name:    alu 
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
module alu(input1,input2,AluCtrl,Result
    );

input [21:0]input1,input2;
input [2:0]AluCtrl;
output reg [21:0] Result;

always @ (*)
	begin
		case(AluCtrl)
		3'b000: begin //XOR
		Result = input1 ^ input2; end

		3'b001: begin //OR
		Result = input1 | input2; end

		3'b010: begin //AND
		Result = input1 & input2; end

		3'b011: begin //ADD
		Result = input1 + input2; end

		3'b100: begin //SUB
		Result = input1 - input2; end

		3'b101: begin //DIV
		Result = input1 / input2; end
		
		3'b110: begin //MUL
		Result = input1 * input2; end

		3'b111: begin //NOT
		Result = ~input1; end


		endcase
	end

endmodule
