module alu(input [7:0]a_in,b_in,
           input [3:0]command_in,
	       input oe_in,
	       output [15:0]d_out);
		   
		   parameter ADD  = 4'b0000; // Add two 8 bit numbers a and b.
		   parameter SUB  = 4'b0001; // sub two 8 bit numbers a and b.
		   parameter AND  = 4'b0010; // logical and opreator
		   parameter OR   = 4'b0011; //logical OR operator
		   parameter NOT  = 4'b0100; //logical NOT operator
		   
		    //Internal variable used during ALU operation
   reg  [15:0]out;
   
    always@(command_in)
      begin
	 case(command_in)
	      ADD : out=a_in+b_in;
	      SUB : out=b_in-a_in;
	      AND : out=(a_in&b_in);
	      OR  : out=(a_in|b_in);
	      NOT : out=~(a_in);
	      default: out=16'h000;
	 endcase
      end
	  
assign d_out = (oe_in) ? out : 16'hzzzz;
		
endmodule

	