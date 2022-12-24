module alu #(parameter data_width = 32)(data_rs1,data_rs2,alu_in,data);

input [data_width-1:0]data_rs1,data_rs2;
input [3:0]alu_in;
output reg [data_width-1:0]data;

always@(*)
	begin
		case(alu_in)
				4'b0000: data = data_rs1 + data_rs2;
				4'b0001: data = data_rs1 - data_rs2;
				4'b0010: data = data_rs1 << data_rs2;
				4'b0011: data = (($signed(data_rs1)) < ($signed(data_rs2))) ? 1:0;
				4'b0100: data = (data_rs1 < data_rs2) ? 1:0;
				4'b0101: data = data_rs1^data_rs2;
				4'b0110: data = data_rs1 >> data_rs2;
				4'b0111: data = data_rs1 >>> data_rs2;
				4'b1000: data = data_rs1 | data_rs2;
				4'b1001: data = data_rs1 & data_rs2;
				default: data = 32'd0;
			endcase
		end
endmodule	
					
					