`timescale 1ns/10ps
module conta_votos (V, R);
  input logic [2:0] V;
  output logic [3:0] R;
  
  wire w1, w2, w3, w4, w5, w6, w7, w8;

//Bit R[3]
AND3X1HVT TT_R3 ( .A(V[2]), .B(V[1]), .C(V[0]), .Y(R[3]));
      
//Bit R[2]  
XOR2X1HVT XOR_BC ( .A(V[1]), .B(V[0]), .Y(w1));
AND2X1HVT AND_Aw1 ( .A(V[2]), .B(w1), .Y(w2));
INVX1HVT INV_A ( .A(V[2]), .Y(w3));
AND3X1HVT AND_w3BC ( .A(w3), .B(V[1]), .C(V[0]), .Y(w4));
OR2X1HVT TT_R2 ( .A(w4), .B(w2), .Y(R[2]));
   
//Bit R[1]  
AND2X1HVT AND_w1w3 ( .A(w3), .B(w1), .Y(w5));
INVX1HVT INV_B ( .A(V[1]), .Y(w6));
INVX1HVT INV_C ( .A(V[0]), .Y(w7));
AND3X1HVT AND_Aw6w7 ( .A(V[2]), .B(w6), .C(w7), .Y(w8));
OR2X1HVT TT_R1 ( .A(w5), .B(w8), .Y(R[1]));
  
//Bit R[0]                     
NOR3X1HVT TT_R0( .A(V[2]), .B(V[1]), .C(V[0]), .Y(R[0]));                            
   
endmodule
