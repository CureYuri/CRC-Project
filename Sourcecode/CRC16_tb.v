`timescale 1ns/1ns 
module CRC16_tb;
      reg              i_clk                 ; 
      reg              i_rst_n               ; //同步复位；
      reg              i_din_valid           ; //输入数据有效；
      reg    [15:0] i_din                 ;//输入数据；
      wire              o_dout_valid          ; //输出CRC值有效；
      wire     [15:0]  o_dout   ;
		
CRC16 U1(
		. i_clk(i_clk),                  //时钟；
      . i_rst_n(i_rst_n),                //同步复位；
      . i_din_valid(i_din_valid),           //输入数据有效；
      . i_din(i_din),                 //输入数据；
      . o_dout_valid(o_dout_valid),           //输出CRC值有效；
      . o_dout(o_dout)                //输出CRC；       
);

initial begin   // 建立时钟
    i_clk = 0;
    forever  #5 i_clk = ~i_clk;
end

initial begin

i_rst_n = 0;
i_din_valid = 0;
i_din = 0;
# 20 
i_rst_n = 1;
i_din = 16'b1010_1010_1010_1010;
#10
i_din_valid = 1;
#10
i_din_valid = 0;
#30 
i_din = 16'b0101_0101_0101_0101;
#30
i_din_valid = 1;
#10
i_din_valid = 0;

end

endmodule 