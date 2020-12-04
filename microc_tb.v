// Autor: Timoté Merieux alu0101318189
`timescale 1 ns / 10 ps 

module microc_tb;

  reg clk, s_abs, s_inc, s_inm, we3, wez, reset;
  reg [2:0] op;
  wire z;
  wire  [5:0] opcode;

microc microc(clk, reset, s_abs, s_inc, s_inm, we3, wez, op, z, opcode);

always
  begin
    clk=1;
    #20;
    clk=0;
    #20;
   end   
initial
  begin
   // hacemos un reset 
   reset=1;
   #10;
   reset=0;
  end

initial
  begin
 // sentencia para mostrar los valores de tiempo y variables
  $monitor("tiempo=%0d z=b s_abs=%b wez=%b reset=%b s_inc=%b we3=%b op=%0d clk=%b s_inm=%b opcode=%0d", $time, clk ,s_abs, s_inc, s_inm, wez, reset, op, z, opcode);
  $dumpfile("microc_tb.vcd");
  $dumpvars;

  #20;
  // Li 1,R1
  s_abs=0;
  s_inc=1;
  s_inm=1;
  we3=1;
  wez=0;
  op=3'b000;


  // Li 2,R2
  #40;
  s_abs=0;
  s_inc=1;
  s_inm=1;
  we3=1;
  wez=0;
  op=3'b000;


  // AND R3, R0, R3
  #40;
  s_abs=0;
  s_inc=1;
  s_inm=0;
  we3=1;
  wez=1;
  op=3'b100;


  // J SIGUE
  #40;
  s_abs=1;
  s_inc=0;
  s_inm=0;
  we3=0;
  wez=0;
  op=3'b000;


  // ADD R3, R1, R3
  #40;
  s_abs=0;
  s_inc=1;
  s_inm=0;
  we3=1;
  wez=1;
  op=3'b010;

  // SUB R2, R1, R2
  #40;
  s_abs=0;
  s_inc=1;
  s_inm=0;
  we3=1;
  wez=1;
  op=3'b011;

  #40;
  if (z == 1) begin
    // JZ FIN
    
    s_abs=1;
    s_inc=0;
    s_inm=0;
    we3=0;
    wez=0;
    op=3'b000;

  end else begin
    s_abs=0;
    s_inc=1;
    s_inm=0;
    we3=0;
    wez=0;
    op=3'b000;
  end


  // JR SIGUE
  #40;
  s_abs=0;
  s_inc=0;
  s_inm=0;
  we3=0;
  wez=0;
  op=3'b000;

  // ADD R3, R1, R3
  #40;
  s_abs=0;
  s_inc=1;
  s_inm=0;
  we3=1;
  wez=1;
  op=3'b010;


  // SUB R2, R1, R2
  #40;
  s_abs=0;
  s_inc=1;
  s_inm=0;
  we3=1;
  wez=1;
  op=3'b011;
    
  #40;
  if (z == 1) begin
    // JZ FIN
    s_abs=1;
    s_inc=0;
    s_inm=0;
    we3=0;
    wez=0;
    op=3'b000;

  end else begin
    s_abs=0;
    s_inc=1;
    s_inm=0;
    we3=0;
    wez=0;
    op=3'b000;
  end
  
  /// JR FIN   
  #40;
  s_abs=0;
  s_inc=0;
  s_inm=0;
  we3=0;
  wez=0;
  op=3'b000;

  /// JR FIN   
  #40;
  s_abs=0;
  s_inc=0;
  s_inm=0;
  we3=0;
  wez=0;
  op=3'b000;

  /// JR FIN   
  #40;
  s_abs=0;
  s_inc=0;
  s_inm=0;
  we3=0;
  wez=0;
  op=3'b000;

  /// JR FIN   
  #40;
  s_abs=0;
  s_inc=0;
  s_inm=0;
  we3=0;
  wez=0;
  op=3'b000;


  #40;
  $finish;
end
    
endmodule