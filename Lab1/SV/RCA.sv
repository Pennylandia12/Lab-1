module fulladder (input  logic a, b, cin, output logic sum, cout);
   
  assign cout = a & b | a & cin | b & cin;
  assign sum = a ^ b ^ cin;
   
endmodule


module RCA (input logic a, b, cin, output logic sum, cout);
fulladder fa(a[0] ,b[0] ,cin[0] ,sum[0] , cout[0]);
fulladder fa2(a[1], b[1], cout[0], sum[1], cout[1]);
fulladder fa3(a[2], b[2], cout[1], sum[2], cout[2]);
fulladder fa4(a[3], b[3], cout[2], sum[3], cout[3]);
assign sum[4] = cout;


endmodule