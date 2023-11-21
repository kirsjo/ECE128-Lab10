`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2023 02:21:25 PM
// Design Name: 
// Module Name: seqMult_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seqMult_tb( );

    reg clk;
    reg reset;
    reg [3:0] A;
    reg [3:0] B;
    wire [7:0] result;
    
    seqMult uut (.clk(clk), .reset(reset), .A(A), .B(B), .result(result));
    
    always begin
        #10 clk = ~clk;
    end
    
    initial begin
        clk = 0;
        reset = 1;
        A = 4'b0011;
        B = 4'b0010;
        
       #20 reset=0;
       #180 reset = 1;
            A = 4'b0100;
            B = 4'b0010;  
       #20 reset = 0;
   end
endmodule
