/*module parameter_keyword(data_in, data_out);

parameter n = 3;
parameter m = 3;

input [n-1:0] data_in;
output  reg [m-1:0] data_out;

always@(*)
begin
data_out = data_in;  // Added logic inside the module
end

endmodule


module example(input_data, output_data);

parameter p = 6;
parameter q = 6;

input [p-1:0] input_data;
output [q-1:0] output_data;

// Instantiating parameter_keyword with parameter overriding
parameter_keyword #(.n(6), .m(6)) DUT (.data_in(input_data), .data_out(output_data));

endmodule*/

module parameter_keyword_rtl(clk,data_in,data_out,wr_addr,rd_addr);

parameter n=4,m=4,wr=4,rd=4;

input  clk;
input [n-1:0] data_in;
input [wr-1:0]wr_addr;
input [rd-1:0]rd_addr;
output reg[n-1:0] data_out;

reg [n-1:0] mem [m-1:0];

always@(posedge clk)
begin
mem[wr_addr]<=data_in;
end

always@(posedge clk)
begin
data_out<=mem[rd_addr];
end

endmodule

module parameter_overriding(clk,data_in,data_out,wr_addr,rd_addr);

parameter p=4,q=4,r=5,s=5;

input clk;
input [p-1:0] data_in;
input [r-1:0] wr_addr;
input [s-1:0] rd_addr;
output wire [p-1:0] data_out;

parameter_keyword_rtl#(.n(6),.m(32),.wr(5),.rd(5)) OVRR (.clk(clk),.data_in(data_in),.data_out(data_out),.wr_addr(wr_addr),.rd_addr(rd_addr));

endmodule

/*module connection(input wire [5:0]w2);

parameter_overriding CONNECTION (.data_out(w2),.wier(w2));

endmodule*/


