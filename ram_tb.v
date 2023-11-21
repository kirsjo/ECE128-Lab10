`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2023 01:46:03 PM
// Design Name: 
// Module Name: ram_tb
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


module ram_tb(
    );
    
    
    reg clk;
    reg reset;
    reg [2:0] address;
    reg write_en;
    reg [7:0] data_in;
    wire [7:0] data_out;
    
    ram uut(.clk(clk), .reset(reset), .address(address), .write_en(write_en), .data_in(data_in), .data_out(data_out));

    
    always begin
        #10 clk = ~clk;
    end
    
    initial begin
        clk = 0;
        reset = 1;
        address = 3'b000;
        write_en = 0;
        data_in = 8'b10101010;
        
        #20 reset = 0;
        #20 address = 3'b001;
        #20 write_en = 1; data_in = 8'b11001100;
        #20 write_en =0;
        
        #20 address=3'b010; write_en = 0;
        #20 write_en=1;
        #20 data_in=8'b00110011;
   end
    
endmodule
