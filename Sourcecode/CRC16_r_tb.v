`timescale 1ns/1ns 
module CRC16_r_tb;
      reg              i_clk_r                 ; 
      reg              i_rst_n_r               ; //同步复位；
      reg              i_din_valid_r           ; //输入数据有效；
      reg    [31:0] i_din_r                 ;//输入数据；
      wire              o_dout_valid_r          ; //输出CRC值有效；
      wire     [15:0]  o_dout_r   ;
		
CRC16_r U2(
		. i_clk_r(i_clk_r),                  //时钟；
      . i_rst_n_r(i_rst_n_r),                //同步复位；
      . i_din_valid_r(i_din_valid_r),           //输入数据有效；
      . i_din_r(i_din_r),                 //输入数据；
      . o_dout_valid_r(o_dout_valid_r),           //输出CRC值有效；
      . o_dout_r(o_dout_r)                //输出CRC；       
);

initial begin   // 建立时钟
    i_clk_r = 0;
    forever  #5 i_clk_r = ~i_clk_r;
end

initial begin

i_rst_n_r = 0;
i_din_valid_r = 0;
i_din_r = 0;
# 20 
i_rst_n_r = 1;
i_din_r = 32'b1010_1010_1010_1010_1111_1011_0001_1010;
#10
i_din_valid_r = 1;
#10
i_din_valid_r = 0;
#30 
i_din_r = 32'b0101_0101_0101_0101_1000_0111_0101_1010;
#30
i_din_valid_r = 1;
#10
i_din_valid_r = 0;

end

endmodule 