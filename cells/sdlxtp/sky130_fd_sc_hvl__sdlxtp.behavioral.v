/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HVL__SDLXTP_BEHAVIORAL_V
`define SKY130_FD_SC_HVL__SDLXTP_BEHAVIORAL_V

/**
 * sdlxtp: ????.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hvl__udp_mux_2to1.v"
`include "../../models/udp_dlatch_p_pp_pg_n/sky130_fd_sc_hvl__udp_dlatch_p_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hvl__sdlxtp (
    Q   ,
    D   ,
    SCD ,
    SCE ,
    GATE
);

    // Module ports
    output Q   ;
    input  D   ;
    input  SCD ;
    input  SCE ;
    input  GATE;

    // Module supplies
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    // Local signals
    wire buf_Q       ;
    wire GATE_delayed;
    wire D_delayed   ;
    wire SCD_delayed ;
    wire SCE_delayed ;
    wire cond0       ;
    wire cond1       ;
    wire cond2       ;
    reg  notifier    ;
    wire mux_out     ;

    //                                     Name       Output   Other arguments
    assign cond0 = ( SCE_delayed === 1'b0 );
    assign cond1 = ( SCE_delayed === 1'b1 );
    sky130_fd_sc_hvl__udp_mux_2to1         mux_2to10 (mux_out, D_delayed, SCD_delayed, SCE_delayed        );
    sky130_fd_sc_hvl__udp_dlatch$P_pp$PG$N dlatch0   (buf_Q  , mux_out, GATE_delayed, notifier, VPWR, VGND);
    buf                                    buf0      (Q      , buf_Q                                      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HVL__SDLXTP_BEHAVIORAL_V