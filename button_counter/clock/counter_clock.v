//Clk: 12MHz
// fpga4student.com: FPGA projects, VHDL projects, Verilog projects

module Clock_divider(

input clk, // input clock on FPGA
input   [1:0]   pmod,
output reg [3:0] led // output clock after dividing the input clock by divisor
    );

reg[23:0] counter=24'd0;
parameter DIVISOR = 24'd12000000;
// The frequency of the output clk_out
//  = The frequency of the input clk_in divided by DIVISOR
// For example: Fclk_in = 12Mhz, if you want to get 1Hz signal to blink LEDs
// You will modify the DIVISOR parameter value to 28'd50.000.000
// Then the frequency of the output clk_out = 12Mhz/12.000.000 = 1Hz


always @(posedge clk)
begin
 counter <= counter + 24'd1;
 if(counter>=(DIVISOR-1)) begin
  counter <= 24'd0;
 end

 if (counter == DIVISOR/2) begin
     led <= led+1'b1;
 end
//  led[1] <= (counter<DIVISOR/2)?1'b0:1'b1;
end
endmodule