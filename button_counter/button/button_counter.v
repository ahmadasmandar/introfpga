// Count up on each button press and display on LEDs

module button_counter (

  //inputs
  input   [1:0]   pmod,
  // input   pmod[1],
  // input   pmod[2],

  //outputs
  output reg [3:0]    led


);

//Wire (net)
wire rst, clk;

//Reset is the invers of the first button

assign rst= ~pmod[0];
assign clk= ~pmod[1];

// Count up on clock rising edge or reset on button push
  always @(posedge clk or posedge rst) begin
    if (rst== 1'b1) begin
      led <= 4'b0;
    end else begin
      led <= led +1'b1;
    end
  end

endmodule