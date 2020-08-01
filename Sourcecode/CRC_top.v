module CRC_top(
	input wire clk,
	input wire rst,
	input wire i_din_valid,
	input wire [15:0]i_din,
	output reg led
);
wire  o_dout_valid;
wire [15:0]o_dout;
wire [32:0]i_din_r;
wire i_din_valid_r;
wire [16:0]o_dout_r;
wire o_dout_valid_r;

CRC16 U1(
		. i_clk(clk),                  //时钟�?
      . i_rst_n(rst),                //同步复位�?
      . i_din_valid(i_din_valid),           //输入数据有效�?
      . i_din(i_din),                 //输入数据�?
      . o_dout_valid(o_dout_valid),           //输出CRC值有效；
      . o_dout(o_dout)                //输出CRC�?       
);

assign i_din_r =  {i_din[15:0],o_dout[15:0]}; 
assign i_din_valid_r = o_dout_valid; 

always @ (posedge clk)
begin
	if(o_dout_r == 0)
	led = 1;
	else
	led = 0;
end

CRC16_r U2(
		. i_clk_r(clk),                 //时钟�?
      . i_rst_n_r(rst),               //同步复位�?
      . i_din_valid_r(i_din_valid_r),           //输入数据有效�?
      . i_din_r(i_din_r),                  //输入数据�?
      . o_dout_valid_r(o_dout_valid_r),          //输出CRC值有效；
      . o_dout_r(o_dout_r)               //输出CRC�?       
);

endmodule 