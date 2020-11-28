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
 // sentencia para mostrar los valores de tiempo y variables
  $monitor("tiempo=%0d z=b s_abs=%b wez=%b reset=%b s_inc=%b we3=%b op=%0d clk=%b s_inm=%b opcode=%0d", $time, clk ,s_abs, s_inc, s_inm, wez, reset, op, z, opcode);
  $dumpfile("microc_tb.vcd");
  $dumpvars;
  // hacemos un reset de ciclos de 20ns
   reset=1;
   #10;
   reset=0;
   #10;

   
  // Li 1,R5
  s_abs=0;
  s_inc=1;
  s_inm=1;
  we3=1;
  wez=0;
  op=3'b000;


  // Li 1,R4
  #40
  s_abs=0;
  s_inc=1;
  s_inm=1;
  we3=1;
  wez=0;
  op=3'b000;


  //Li 2,R2
  #40
  s_abs=0;
  s_inc=1;
  s_inm=1;
  we3=1;
  wez=0;
  op=3'b000;


  //  J CHECK 
  #40
  s_abs=1;
  s_inc=0;
  s_inm=0;
  we3=0;
  wez=0;
  op=3'b000;


  // SUB R5,R2,R0
  #40
  s_abs=0;
  s_inc=1;
  s_inm=0;
  we3=1;
  wez=1;
  op=3'b011;


  // JNZ LOOP
  #40
  s_abs=1;
  s_inc=1;
  s_inm=1;
  we3=0;
  wez=0;
  op=3'b000;


  // ADD R5,R4,R5
  #40
  s_abs=0;
  s_inc=1;
  s_inm=0;
  we3=1;
  wez=1;
  op=3'b010;
  
  
  // SUB R5,R2,R0
  #40
  s_abs=0;
  s_inc=1;
  s_inm=0;
  we3=1;
  wez=1;
  op=3'b011;


  // JNZ LOOP
  #40
  s_abs=0;
  s_inc=1;
  s_inm=1;
  we3=0;
  wez=0;
  op=3'b000;
  
  
  // JR END
  #40
  s_abs=0;
  s_inc=0;
  s_inm=1;
  we3=0;
  wez=0;
  op=3'b000;
  
  
  // JR END
  #40
  s_abs=0;
  s_inc=0;
  s_inm=1;
  we3=0;
  wez=0;
  op=3'b000;
  
  
  // JR END
  #40
  s_abs=0;
  s_inc=0;
  s_inm=1;
  we3=0;
  wez=0;
  op=3'b000;
  
  
  // JR END
  #40
  s_abs=0;
  s_inc=0;
  s_inm=1;
  we3=0;
  wez=0;
  op=3'b000;

  $finish;
end
    
endmodule