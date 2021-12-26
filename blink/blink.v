//Blinky Clk: 12MHz
// fpga4student.com: FPGA projects, VHDL projects, Verilog projects
// Verilog project: Verilog code for clock divider on FPGA
// Top level Verilog code for clock divider on FPGA
module Clock_divider(

input clk, // input clock on FPGA
output reg [1:0] led // output clock after dividing the input clock by divisor
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
 if(counter>=(DIVISOR-1))
  counter <= 24'd0;
 led[0] <= (counter<DIVISOR/2)?1'b1:1'b0;
//  led[1] <= (counter<DIVISOR/2)?1'b0:1'b1;
end
endmodule