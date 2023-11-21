module seqMult(
    input clk,
    input reset,
    input wire [3:0] A,
    input wire [3:0] B,
    output reg [7:0] result
);

    parameter S0=0, S1=1, S2=2;
    reg [7:0] partial_product;
    reg [2:0] shift_count;
    reg [7:0] multiplicand ;
    reg [3:0] bb;
    
    reg [2:0] cs, ns;
    
    always @ (posedge clk) begin
        if(reset)
            cs = S0;
        else
            cs = ns;
    end
    
    always @ (cs, reset) begin
    case (cs)
        S0: begin
            result = 0;
            partial_product = 8'b0;
            shift_count = 3'b0;
            multiplicand = {4'b0, A};
            bb = B;
            ns = S1;
        end
        S1: begin
            ns = S2;
            if ((bb[0] == 0) && (shift_count <4)) begin
                partial_product = partial_product;
                shift_count = shift_count + 3'b1;
                multiplicand = multiplicand << 1;
                bb = bb >> 1;
            end
            else if ((bb[0] ==1) && (shift_count < 4)) begin
                partial_product = partial_product + multiplicand;
                shift_count = shift_count + 3'b1;
                multiplicand = multiplicand << 1;
                bb = bb >> 1;
            end
        end
        S2: begin
            if (shift_count ==4) begin
                ns=S2;
                result = partial_product;
            end
            else begin
                ns = S1;
            end
            end
       endcase
   end
endmodule