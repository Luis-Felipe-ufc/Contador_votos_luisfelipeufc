`timescale 1ns/10ps
module conta_votos_tb;
  logic [2:0] V;
  logic [3:0] R;
  
  // instantiating the module to map connections
  conta_votos conta( .V(V), .R(R));
  
 initial begin
  integer i;
  for (i = 0; i < 8; i = i + 1) begin
    V = i;  
    #5;                    
  end
end
  
   initial
    begin
      $display("                 Tempo  Entrada    Saída");
      $display("                        V [2:0]   R [3:0]");
      $display("                 ====   =======   ======");
      $monitor($time,"      %b      %b  ",V, R);
    end
  
endmodule
