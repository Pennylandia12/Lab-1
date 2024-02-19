`timescale 1ns / 1ps
/*module tb ();

   logic        a;
   logic 	b;
   logic 	cin;
   logic 	sum;
   logic    cout;
   logic        clk;   

  // instantiate device under test
   fulladder dut (a, b, cin, sum, cout);

   // 2 ns clock
   initial
     begin	
	clk = 1'b1;
	forever #10 clk = ~clk;
     end


   initial
     begin
    
	#0   a = 0;	
	#0   b = 0;	
	#0   cin = 0;

	#20  a = 0;	
	#0   b = 0;	
	#0   cin = 1;

	#20  a = 0;	
	#0   b = 1;	
	#0   cin = 0;	

	#20  a = 0;	
	#0   b = 1;	
	#0   cin = 1;	

	#20  a = 1;	
	#0   b = 0;	
	#0   cin = 0;	

	#20  a = 1;	
	#0   b = 0;	
	#0   cin = 1;	

	#20  a = 1;	
	#0   b = 1;	
	#0   cin = 0;	

	#20  a = 1;	
	#0   b = 1;	
	#0   cin = 1;	


	
     end  
endmodule */
module tb();
    logic        a;
    logic 	b;
    logic 	cin;
    logic 	sum;
    logic    cout;
    logic        clk; 
	

	RCA dut (a, b, cin, sum, cout);
	assign Sum_correct = a + b + cin;

	// 2 ns clock
    initial
      begin	
	 clk = 1'b1;
	 forever #10 clk = ~clk;
      end

	integer handle3;
	integer desc3;
	integer i;
	initial
		begin
			handle3 = $fopen("rca.out");
			desc3 = handle3;
			#1250 $finish;
		end
	initial
		begin
			for (i=0; i < 150; i=i+1)
				begin
				// Put vectors before beginning of clk
				@(posedge clk)
					begin
						a = $random;
						b = $random;
						cin = $random;
					end
				@(negedge clk)
					begin
					$fdisplay(desc3, "%h %h || %h | %h | %b", a, b, sum, Sum_correct, (sum ==
					Sum_correct));
					end
				end // @(negedge clk)
		end
endmodule