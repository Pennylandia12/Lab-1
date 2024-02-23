module fulladder (input  logic a, b, cin, output logic sum, cout);
   
  assign cout = a & b | a & cin | b & cin;
  assign sum = a ^ b ^ cin;
   
endmodule


module RCA (a, b, cin, sum);
input logic[3:0] a, b;
input logic cin; 
output logic [4:0] sum;
///output logic cout;

logic [2:0]cout_wire;

fulladder fa(a[0] ,b[0] , cin, sum[0] , cout_wire[0]);
fulladder fa2(a[1], b[1], cout_wire[0], sum[1], cout_wire[1]);
fulladder fa3(a[2], b[2], cout_wire[1], sum[2], cout_wire[2]);
fulladder fa4(a[3], b[3], cout_wire[2], sum[3], sum[4]);
//assign sum[4] = cout;


endmodule