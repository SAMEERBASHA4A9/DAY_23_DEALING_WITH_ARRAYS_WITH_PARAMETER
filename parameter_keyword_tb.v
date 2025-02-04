module parameter_keyword_test(clk,data_in,data_out,wr_addr,rd_addr);

parameter p=6,q=6,r=5,s=5;

output reg clk;
output reg [p-1:0]data_in;
output reg [r-1:0]wr_addr;
output reg [s-1:0]rd_addr;
input [p-1:0] data_out;

parameter_overriding#(.p(6),.q(6),.r(5),.s(5)) DUT(.clk(clk),.data_in(data_in),.data_out(data_out),.wr_addr(wr_addr),.rd_addr(rd_addr));


initial 
begin 
clk=1'b0;
forever
#5 clk=~clk;
end


initial
begin
@(negedge clk);
data_in=6'd10;
wr_addr=5'd31;
rd_addr=5'd31;
$monitor("data_in=%0d,data_out=%0d,wr_addr=%0d,rd_addr=%0d",data_in,data_out,wr_addr,rd_addr);
end

endmodule
