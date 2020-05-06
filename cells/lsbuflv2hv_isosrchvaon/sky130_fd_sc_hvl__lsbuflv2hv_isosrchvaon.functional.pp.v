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


`ifndef SKY130_FD_SC_HVL__LSBUFLV2HV_ISOSRCHVAON_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HVL__LSBUFLV2HV_ISOSRCHVAON_FUNCTIONAL_PP_V

/**
 * lsbuflv2hv_isosrchvaon: Level shift buffer, low voltage to high
 *                         voltage, isolated well on input buffer,
 *                         inverting sleep mode input, zero power
 *                         sleep mode.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_isolatchhv_pp_plg_s/sky130_fd_sc_hvl__udp_isolatchhv_pp_plg_s.v"

`celldefine
module sky130_fd_sc_hvl__lsbuflv2hv_isosrchvaon (
    X      ,
    A      ,
    SLEEP_B,
    VPWR   ,
    VGND   ,
    LVPWR  ,
    VPB    ,
    VNB
);

    // Module ports
    output X      ;
    input  A      ;
    input  SLEEP_B;
    input  VPWR   ;
    input  VGND   ;
    input  LVPWR  ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire SLEEP               ;
    wire and0_out_X          ;
    wire isolatchhv_pp0_out_X;

    //                                        Name            Output                Other arguments
    not                                       not0           (SLEEP               , SLEEP_B                             );
    and                                       and0           (and0_out_X          , SLEEP_B, A                          );
    sky130_fd_sc_hvl__udp_isolatchhv_pp$PLG$S isolatchhv_pp0 (isolatchhv_pp0_out_X, and0_out_X, VPWR, LVPWR, VGND, SLEEP);
    buf                                       buf0           (X                   , isolatchhv_pp0_out_X                );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HVL__LSBUFLV2HV_ISOSRCHVAON_FUNCTIONAL_PP_V