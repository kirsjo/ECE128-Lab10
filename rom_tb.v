`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2023 02:04:25 PM
// Design Name: 
// Module Name: rom_tb
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


module rom_tb();

    reg [2:0] address;
    wire [3:0] data;
    
    rom uut(.data(data), .address(address));
    
    initial begin
    address = 3'b000;
    #10 address = 3'b001;
    #10 address = 3'b010;
    #10 address = 3'b100;
    #10 address = 3'b101;
    #10 address = 3'b110;
    #10 address = 3'b111;
    #10 $stop;
    end
        

endmodule
