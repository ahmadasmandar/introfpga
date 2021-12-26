// Module

module amd_gate (

  //inputs
  input   [0:1]   pmod,
  // input   pmod[1],
  // input   pmod[2],

  //outputs
  output [2:0]    led


);

//Wire (net)
wire not_pmod_0;


// assign make connection in the hw

assign not_pmod_0 = ~pmod[0];

assign led[1:0] = {2{not_pmod_0}};

//Continuous assignment: NOT and AND operators
assign led[2] = not_pmod_0 & ~pmod[1];

endmodule