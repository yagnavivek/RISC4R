module pc #(parameter width =32)(clk,add_in,add_out);

input clk;
input [width-1:0]add_in;
output reg [width-1:0]add_out;

always@(posedge clk)
begin
	add_out <= add_in;
end

endmodule
