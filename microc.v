module microc(input wire clk, reset, s_abs, s_inc, s_inm, we3, wez, input wire [2:0] op, output wire z, output wire [5:0] opcode);
//Microcontrolador sin memoria de datos de un solo ciclo

wire [9:0] pc_in, pc_out, sum_out, mux_out;
wire [15:0] instruction;
wire [7:0] inm, variableBasura, alu_out, wd3, rd1, rd2;
wire zalu;
//Instanciar e interconectar pc, memprog, regfile, alu, sum, biestable Z y mux's

// Saltos (J, JR, JZ, JNZ) 
registro#(10) PC(.clk(clk), .reset(reset), .d(pc_in), .q(pc_out));

mux2#(10) muxPC(.da0(sum_out), .d1(instruction[9:0]), .s(s_abs), .y(pc_in));
mux2#(10) muxSUM(.d0(instruction[9:0]), .d1(10'b1), .s(s_inc), .y(mux_out));
sum sum(.a(pc_out), .b(mux_out), .y(sum_out));

assign opcode = instruction[15:10];

memprog memory(.clk(clk), .a(pc_out), .rd(instruction));


assign inm = instruction[11:4];
mux2 muxINM(.d0(alu_out), .d1(inm), .s(s_inm), .y(wd3));


assign variableBasura = instruction[11:4];
assign variableTimo [7:0] = 8'b0;

regfile register(.clk(clk), .we3(we3), .ra1(variableBasura[7:4]), .ra2(variableBasura[3:0]), .wa3(instruction[3:0]), .wd3(wd3), .rd1(rd1), .rd2(rd2));

alu alu(.a(rd1), .b(rd2), .op(op), .y(alu_out), .zero(zalu));

ffd ffz(.clk(clk), .reset(reset), .d(zalu), .carga(wez), .q(z));

endmodule
