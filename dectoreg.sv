module dectoreg #(parameter add_width = 5, parameter data_width = 32)(instr_in,add_rs1,add_rs2,add_rd,func7,func3,opcode);

input [data_width-1:0]instr_in;
output reg[add_width-1:0]add_rs1,add_rs2,add_rd;
output reg[6:0]func7,opcode;
output reg[2:0]func3;


assign func7 = instr_in[31:25];
assign add_rs2 = instr_in[24:20];
assign add_rs1 = instr_in[19:15];
assign func3 = instr_in[14:12];
assign add_rd = instr_in[11:7];
assign opcode = instr_in[6:0];


endmodule
