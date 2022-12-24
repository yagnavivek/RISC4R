module pcaddr #(parameter width = 32)(add_in,add_out);

input [width-1:0]add_in;
output [width-1:0]add_out;

assign add_out=add_in+32'd4;
     
endmodule
