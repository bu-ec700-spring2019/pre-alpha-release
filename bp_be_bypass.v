/**
 *
 * Name:
 *   bp_be_bypass.v
 * 
 * Description:
 *   Register bypass network for up to 2 source registers and 1 destination register.
 *
 * Parameters:
 *   fwd_els_p        - Number of potential forwarding candidates. Should be
 *                      equal to # stages in pipeline after dispatch
 *   enable_p         - When disabled, module becomes passthrough. Useful for debugging.
 *
 * Inputs:
 *   id_rs1_v_i       - 
 *   id_rs1_addr_i    - Dispatched source register address
 *   id_rs1_i         - Dispatched source register data (from regfile)
 *
 *   id_rs2_v_i       - 
 *   id_rs2_addr_i    - Dispatched source register address
 *   id_rs2_i         - Dispatched source register data (from regfile)
 *
 *   fwd_rd_v_i       - 
 *   fwd_rd_addr_i    - Forwarded writeback address
 *   fwd_rd_i         - Forwarded writeback data (from completed instr)
 *
 * Outputs:
 *   bypass_rs1_o     - Most recent register data available in pipeline
 *   bypass_rs2_o     - Most recent register data available in pipeline
 *   
 * Keywords:
 *   register, bypass, forward 
 */

module bp_be_bypass
 #(parameter fwd_els_p = "inv"

   // Default parameters
   , parameter enable_p = 1

   // Generated parameters
   // # Bypasses == Number of forwarded elements + 1 for the dispatched data
   , localparam bypass_els_p = fwd_els_p + 1 
   )
  (
   // Dispatched instruction operands
   input logic                                              id_rs1_v_i
   , input logic[rv64_reg_addr_width_gp-1:0]                id_rs1_addr_i
   , input logic[rv64_reg_data_width_gp-1:0]                id_rs1_i

   , input logic                                            id_rs2_v_i
   , input logic[rv64_reg_addr_width_gp-1:0]                id_rs2_addr_i
   , input logic[rv64_reg_data_width_gp-1:0]                id_rs2_i

   // Completed rd writes in the pipeline
   , input logic[fwd_els_p-1:0]                             fwd_rd_v_i
   , input logic[fwd_els_p-1:0][rv64_reg_addr_width_gp-1:0] fwd_rd_addr_i
   , input logic[fwd_els_p-1:0][rv64_reg_data_width_gp-1:0] fwd_rd_i

   // The latest valid rs1, rs2 data
   , output logic[rv64_reg_data_width_gp-1:0]               bypass_rs1_o
   , output logic[rv64_reg_data_width_gp-1:0]               bypass_rs2_o
   );

initial begin : parameter_validation
  assert(fwd_els_p > 0 && fwd_els_p != "inv") 
    else $error("fwd_els_p must be positive, else there is nothing to bypass. " 
                + "Did you remember to set it?");

  assert(enable_p == 1)
    else $warning("Bypassing disabled");
end

// Intermediate connections
logic[bypass_els_p-1:0] rs1_match_vector       , rs2_match_vector;
logic[bypass_els_p-1:0] rs1_match_vector_onehot, rs2_match_vector_onehot;

logic[bypass_els_p-1:0][rv64_reg_data_width_gp-1:0] rs1_data_vector, rs2_data_vector;

// Module instantiations
if(enable_p == 1) begin
  // Find the youngest valid data to forward
  bsg_priority_encode_one_hot_out #(.width_p(bypass_els_p)
                                    ,.lo_to_hi_p(1)
                                    ) match_one_hot_rs1
                                   (.i(rs1_match_vector)
                                    ,.o(rs1_match_vector_onehot)
                                    );

  bsg_priority_encode_one_hot_out #(.width_p(bypass_els_p)
                                    ,.lo_to_hi_p(1)
                                    ) match_one_hot_rs2
                                   (.i(rs2_match_vector)
                                    ,.o(rs2_match_vector_onehot)
                                    );

  // Bypass data with a simple crossbar
  bsg_crossbar_o_by_i #(.i_els_p(bypass_els_p)
                        ,.o_els_p(1)
                        ,.width_p(rv64_reg_data_width_gp)
                        ) rs1_crossbar
                       (.i(rs1_data_vector)
                        ,.sel_oi_one_hot_i(rs1_match_vector_onehot)
                        ,.o(bypass_rs1_o)
                        );

  bsg_crossbar_o_by_i #(.i_els_p(bypass_els_p)
                        ,.o_els_p(1)
                        ,.width_p(rv64_reg_data_width_gp)
                        ) rs2_crossbar
                       (.i(rs2_data_vector)
                        ,.sel_oi_one_hot_i(rs2_match_vector_onehot)
                        ,.o(bypass_rs2_o)
                        );
end else begin
  // Passthrough if disabled
  assign bypass_rs1_o = id_rs1_i;
  assign bypass_rs2_o = id_rs2_i;
end

always_comb begin : vector_generation
  // Completion data has priority over dispatched data, so dispatched data goes to MSB
  rs1_data_vector = {id_rs1_i, fwd_rd_i};
  rs2_data_vector = {id_rs2_i, fwd_rd_i};

  for(integer i = 0; i < bypass_els_p; i+=1) begin : match_vector
    // Dispatched data always matches the dispatched data, otherwise check for:
    // * Register address match 
    // * The completing instruction is writing and the dispatched instruction is reading
    // * Do not forward X0 data, RISC-V defines this as always 0.
    rs1_match_vector[i] = ((i == bypass_els_p-1)
                           || ((id_rs1_addr_i == fwd_rd_addr_i[i])
                               & (id_rs1_v_i & fwd_rd_v_i[i])
                               & (id_rs1_addr_i != rv64_reg_addr_width_gp'(0))
                               )
                           );

    rs2_match_vector[i] = ((i == bypass_els_p-1)
                           || ((id_rs2_addr_i == fwd_rd_addr_i[i]) 
                               & (id_rs2_v_i & fwd_rd_v_i[i]) 
                               & (id_rs2_addr_i != rv64_reg_addr_width_gp'(0))
                               )
                           );
  end
end

endmodule : bp_be_bypass
