module regfile #(parameter add_width = 5, parameter data_width = 32)(clk,add_rs1,add_rs2,add_rd,write_data,
regwrite,data_rs1,data_rs2);

input [add_width-1:0]add_rs1,add_rs2,add_rd;
input [data_width-1:0]write_data;
input clk,regwrite;
output [data_width-1:0]data_rs1,data_rs2;
reg [data_width-1:0]regi[2**(add_width)-1:0];
integer i;
initial
begin
for(i=0;i<6;i=i+1) begin
	regi[i] = 32'h00000000; end
	regi[6] = 32'h00000002;
	regi[7] = 32'h00000001;
for(i=8;i<(2**(add_width));i=i+1) begin
	regi[i] = 32'h00000000; end
end

always@(posedge clk) begin
if(regwrite)
	regi[add_rd] <= write_data; end
	
assign data_rs1 = regi[add_rs1];
assign data_rs2 = regi[add_rs2];

endmodule
