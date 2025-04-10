module alu_tb();
    
   //Testbench global variables
   reg [7:0]a_in,b_in;
   reg [3:0]command_in;
   reg enable_in;
   wire [15:0]out;
	

   //Parameter constants used for displaying the strings during operation
   parameter ADD  = 4'b0000, // Add two 8 bit numbers a and b.
			 SUB  = 4'b0001, // sub two 8 bit numbers b and a.
			 AND  = 4'b0010, // logical AND operator.
			 OR   = 4'b0011, // logical OR operator.
			 NOT  = 4'b0100; // logical NOT operator.
  	     
   //Internal register for storing the string values
   reg [4*8:0]string_cmd;

   //Step1 : Instantiate the design ALU
alu dut(a_in,b_in,command_in,enable_in,out);


task inputs(input [7:0]j,k);
	begin
		a_in=j;
		b_in=k;
	end
endtask

		
   //Process to hold the string values as per the commands.
   always@(command_in)
      begin
         case(command_in)
	    ADD    :  string_cmd = "ADD";
	    SUB    :  string_cmd = "SUB";
	    AND    :  string_cmd = "AND";
	    OR     :  string_cmd = "OR";
	    NOT    :  string_cmd = "NoT";
	   endcase
      end
			
   initial
   begin
     enable_in=1;
		inputs(8'd20,8'd10); command_in=ADD;#10;
		inputs(8'd20,8'd30); command_in=SUB;#10;
		inputs(8'd6,8'd4); command_in=AND;#10;
		inputs(8'd6,8'd4); command_in=OR;#10;
		a_in=8'd5; command_in=NOT; #10;
      end
			
 
   initial 
      $monitor("Input a_in=%d, b_in=%d, command_in=%d, enable_in=%d Output out=%d",a_in,b_in,command_in, enable_in,out);
	initial #200 $finish;					
   
endmodule
