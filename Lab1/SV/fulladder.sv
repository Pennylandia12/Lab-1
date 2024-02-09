module fulladder (input  logic a, b, cin, output logic sum, cout);
   
  assign cout = a & b | a & cin | b & cin;
  assign sum = a ^ b ^ cin;
   
endmodule
