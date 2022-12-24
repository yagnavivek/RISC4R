module singlar #(parameter data_width = 32, addr_width = 5)(input clk,output [data_width-1:0]alu_data_out);

wire [data_width-1:0]pcaddr_out,pc_out,inst_out,write_data,data_rs1,data_rs2;
wire [addr_width-1:0]add_rs1,add_rs2,add_rd;
wire [6:0]func7,opcode;
wire [2:0]func3;
wire [3:0]alu_in;
wire regwrite; 

pc #(data_width)p1(clk,pcaddr_out,pc_out);
pcaddr #(data_width)p2(pc_out,pcaddr_out);
instr_mem #(data_width)p3(clk,pc_out,inst_out);
dectoreg #(addr_width,data_width)p4(inst_out,add_rs1,add_rs2,add_rd,func7,func3,opcode);
regfile #(addr_width,data_width)p5(clk,add_rs1,add_rs2,add_rd,write_data,regwrite,data_rs1,data_rs2);
alucontrol #(data_width)p6(func7,func3,opcode,regwrite,alu_in);
alu #(data_width)p7(data_rs1,data_rs2,alu_in,write_data);

assign alu_data_out = write_data;

endmodule 