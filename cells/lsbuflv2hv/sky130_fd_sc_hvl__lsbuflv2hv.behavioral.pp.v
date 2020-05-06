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


`ifndef SKY130_FD_SC_HVL__LSBUFLV2HV_BEHAVIORAL_PP_V
`define SKY130_FD_SC_HVL__LSBUFLV2HV_BEHAVIORAL_PP_V

/**
 * lsbuflv2hv: Level-shift buffer, low voltage-to-high voltage,
 *             isolated well on input buffer, double height cell.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hvl__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hvl__lsbuflv2hv (
    X    ,
    A    ,
    VPWR ,
    VGND ,
    LVPWR,
    VPB  ,
    VNB
);

    // Module ports
    output X    ;
    input  A    ;
    input  VPWR ;
    input  VGND ;
    input  LVPWR;
    input  VPB  ;
    input  VNB  ;

    // Local signals
    wire pwrgood_pp0_out_A;
    wire buf0_out_X       ;

    //                                  Name         Output             Other arguments
    sky130_fd_sc_hvl__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_A, A, LVPWR, VGND        );
    buf                                 buf0        (buf0_out_X       , pwrgood_pp0_out_A     );
    sky130_fd_sc_hvl__udp_pwrgood_pp$PG pwrgood_pp1 (X                , buf0_out_X, VPWR, VGND);

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HVL__LSBUFLV2HV_BEHAVIORAL_PP_V