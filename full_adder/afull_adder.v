// Module

module amd_gate (

  //inputs
  input   [2:0]   pmod,
  // input   pmod[1],
  // input   pmod[2],
  // input   pmod[3],

  //outputs
  output [1:0]    led


);

//Wire (net)
wire w_ab_xor,w_ab_and,w_abc_and;


// assign make connection in the hw

assign w_ab_xor = ~pmod[0] ^ ~pmod[1];
assign w_ab_and = ~pmod[0] & ~pmod[1];
assign w_abc_and = ~pmod[2] & w_ab_xor;

// assign led[0] = {2{not_pmod_0}};

//Continuous assignment: NOT and AND operators

assign led[0] = w_ab_xor ^ ~pmod[2];
assign led[1] = w_ab_and | {w_ab_xor  & ~pmod[2] };

endmodule