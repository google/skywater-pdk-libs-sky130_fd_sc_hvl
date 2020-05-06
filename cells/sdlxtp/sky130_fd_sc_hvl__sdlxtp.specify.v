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

specify
(D +=> Q ) = (0:0:0,0:0:0);                     // delays are tris,tfall
(SCD +=> Q ) = (0:0:0,0:0:0);      // adding as per CDT 106221
(SCE => Q ) = (0:0:0,0:0:0);       // adding as per CDT 106221
(posedge GATE => (Q +: D ) ) = (0:0:0,0:0:0);  // delays are tris,tfall
$width (posedge GATE , 0:0:0, 0, notifier);
$setuphold ( negedge GATE , posedge D , 0:0:0, 0:0:0, notifier , , COND0 , GATE_delayed , D_delayed ) ;
$setuphold ( negedge GATE , negedge D , 0:0:0, 0:0:0, notifier , , COND0 , GATE_delayed , D_delayed ) ;
$setuphold ( negedge GATE , posedge SCD , 0:0:0, 0:0:0, notifier , , COND1 , GATE_delayed , SCD_delayed ) ;
$setuphold ( negedge GATE , negedge SCD , 0:0:0, 0:0:0, notifier , , COND1 , GATE_delayed , SCD_delayed ) ;
$setuphold ( negedge GATE , posedge SCE , 0:0:0, 0:0:0, notifier , , , GATE_delayed , SCE_delayed ) ;
$setuphold ( negedge GATE , negedge SCE , 0:0:0, 0:0:0, notifier , , , GATE_delayed , SCE_delayed ) ;
endspecify