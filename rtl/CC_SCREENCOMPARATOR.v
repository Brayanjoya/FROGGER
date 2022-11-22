//######################################################################
//#	G0B1T: HDL EXAMPLES. 2018.
//######################################################################
//# Copyright (C) 2018. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
//# 
//# This program is free software: you can redistribute it and/or modify
//# it under the terms of the GNU General Public License as published by
//# the Free Software Foundation, version 3 of the License.
//#
//# This program is distributed in the hope that it will be useful,
//# but WITHOUT ANY WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//# GNU General Public License for more details.
//#
//# You should have received a copy of the GNU General Public License
//# along with this program.  If not, see <http://www.gnu.org/licenses/>
//####################################################################*/
//=======================================================
//  MODULE Definition
//=======================================================
module CC_SCREENCOMPARATOR (
//////////// OUTPUTS //////////
	CC_SCREENCOMPARATOR_regGAME_data7_OutBus,
	CC_SCREENCOMPARATOR_regGAME_data6_OutBus,
	CC_SCREENCOMPARATOR_regGAME_data5_OutBus,
	CC_SCREENCOMPARATOR_regGAME_data4_OutBus,
	CC_SCREENCOMPARATOR_regGAME_data3_OutBus,
	CC_SCREENCOMPARATOR_regGAME_data2_OutBus,
	CC_SCREENCOMPARATOR_regGAME_data1_OutBus,
	CC_SCREENCOMPARATOR_regGAME_data0_OutBus,
	CC_SCREENCOMPARATOR_load_OutLow,
//////////// INPUTS //////////
	CC_SCREENCOMPARATOR_state_data_InBus,
	CC_SCREENCOMPARATOR_level_data_InBus,
	CC_SCREENCOMPARATOR_positionYCOUNTER_data_InBus,
	CC_SCREENCOMPARATOR_regGAME_data7_InBus
);
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter DATAWIDTH_STATE = 3;
parameter DATAWIDTH_LEVEL = 3;
parameter NUMBER_DATAWIDTH = 8;
parameter FROGGPOSITION_DATAWIDTH = 3;
//=======================================================
//  PORT declarations
//=======================================================
output reg 	[NUMBER_DATAWIDTH-1:0] CC_SCREENCOMPARATOR_regGAME_data7_OutBus;
output reg	[NUMBER_DATAWIDTH-1:0] CC_SCREENCOMPARATOR_regGAME_data6_OutBus;
output reg	[NUMBER_DATAWIDTH-1:0] CC_SCREENCOMPARATOR_regGAME_data5_OutBus;
output reg	[NUMBER_DATAWIDTH-1:0] CC_SCREENCOMPARATOR_regGAME_data4_OutBus;
output reg	[NUMBER_DATAWIDTH-1:0] CC_SCREENCOMPARATOR_regGAME_data3_OutBus;
output reg	[NUMBER_DATAWIDTH-1:0] CC_SCREENCOMPARATOR_regGAME_data2_OutBus;
output reg	[NUMBER_DATAWIDTH-1:0] CC_SCREENCOMPARATOR_regGAME_data1_OutBus;
output reg	[NUMBER_DATAWIDTH-1:0] CC_SCREENCOMPARATOR_regGAME_data0_OutBus;
output reg	CC_SCREENCOMPARATOR_load_OutLow;
input 	[DATAWIDTH_STATE-1:0] CC_SCREENCOMPARATOR_state_data_InBus;
input 	[DATAWIDTH_LEVEL-1:0] CC_SCREENCOMPARATOR_level_data_InBus;
input    [FROGGPOSITION_DATAWIDTH-1:0] CC_SCREENCOMPARATOR_positionYCOUNTER_data_InBus;
input		[NUMBER_DATAWIDTH-1:0] CC_SCREENCOMPARATOR_regGAME_data7_InBus;
//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
//STRUCTURAL
always @(*)
begin
	// Default//
	// Inicio Frogger-face //
	if (CC_SCREENCOMPARATOR_state_data_InBus == 3'b001)
	begin
		CC_SCREENCOMPARATOR_regGAME_data7_OutBus = 8'b00100100;
		CC_SCREENCOMPARATOR_regGAME_data6_OutBus = 8'b01111110;
		CC_SCREENCOMPARATOR_regGAME_data5_OutBus = 8'b11111111;
		CC_SCREENCOMPARATOR_regGAME_data4_OutBus = 8'b11011011;
		CC_SCREENCOMPARATOR_regGAME_data3_OutBus = 8'b01111110;
		CC_SCREENCOMPARATOR_regGAME_data2_OutBus = 8'b01000010;
		CC_SCREENCOMPARATOR_regGAME_data1_OutBus = 8'b10111101;
		CC_SCREENCOMPARATOR_regGAME_data0_OutBus = 8'b10000001;
	end
	// Trophy Win-state //
	else if (CC_SCREENCOMPARATOR_state_data_InBus == 3'b010)
	begin
		CC_SCREENCOMPARATOR_regGAME_data7_OutBus = 8'b00111100;
		CC_SCREENCOMPARATOR_regGAME_data6_OutBus = 8'b11111111;
		CC_SCREENCOMPARATOR_regGAME_data5_OutBus = 8'b10111101;
		CC_SCREENCOMPARATOR_regGAME_data4_OutBus = 8'b01111110;
		CC_SCREENCOMPARATOR_regGAME_data3_OutBus = 8'b00111100;
		CC_SCREENCOMPARATOR_regGAME_data2_OutBus = 8'b00011000;
		CC_SCREENCOMPARATOR_regGAME_data1_OutBus = 8'b00011000;
		CC_SCREENCOMPARATOR_regGAME_data0_OutBus = 8'b00111100;
	end
	// Skull Lose-State //
	else if (CC_SCREENCOMPARATOR_state_data_InBus == 3'b011)
	begin
		CC_SCREENCOMPARATOR_regGAME_data7_OutBus = 8'b01111110;
		CC_SCREENCOMPARATOR_regGAME_data6_OutBus = 8'b11111111;
		CC_SCREENCOMPARATOR_regGAME_data5_OutBus = 8'b10111101;
		CC_SCREENCOMPARATOR_regGAME_data4_OutBus = 8'b10011001;
		CC_SCREENCOMPARATOR_regGAME_data3_OutBus = 8'b11111111;
		CC_SCREENCOMPARATOR_regGAME_data2_OutBus = 8'b01100110;
		CC_SCREENCOMPARATOR_regGAME_data1_OutBus = 8'b01100110;
		CC_SCREENCOMPARATOR_regGAME_data0_OutBus = 8'b00111100;
	end
	// Check Pass_0-State //
	else if (CC_SCREENCOMPARATOR_state_data_InBus == 3'b101)
	begin
		CC_SCREENCOMPARATOR_regGAME_data7_OutBus = 8'b00000000;
		CC_SCREENCOMPARATOR_regGAME_data6_OutBus = 8'b00000001;
		CC_SCREENCOMPARATOR_regGAME_data5_OutBus = 8'b00000011;
		CC_SCREENCOMPARATOR_regGAME_data4_OutBus = 8'b00000110;
		CC_SCREENCOMPARATOR_regGAME_data3_OutBus = 8'b10001100;
		CC_SCREENCOMPARATOR_regGAME_data2_OutBus = 8'b11011000;
		CC_SCREENCOMPARATOR_regGAME_data1_OutBus = 8'b01110000;
		CC_SCREENCOMPARATOR_regGAME_data0_OutBus = 8'b00100000;
	end
	//=================
	//---- Numeros ----
	//=================
	else if (CC_SCREENCOMPARATOR_state_data_InBus == 3'b110 && CC_SCREENCOMPARATOR_level_data_InBus==3'b001)
	// Número 1 Pass_1-State //
	begin
		CC_SCREENCOMPARATOR_regGAME_data7_OutBus = 8'b00011000;
		CC_SCREENCOMPARATOR_regGAME_data6_OutBus = 8'b00111000;
		CC_SCREENCOMPARATOR_regGAME_data5_OutBus = 8'b01111000;
		CC_SCREENCOMPARATOR_regGAME_data4_OutBus = 8'b00011000;
		CC_SCREENCOMPARATOR_regGAME_data3_OutBus = 8'b00011000;
		CC_SCREENCOMPARATOR_regGAME_data2_OutBus = 8'b00011000;
		CC_SCREENCOMPARATOR_regGAME_data1_OutBus = 8'b00011000;
		CC_SCREENCOMPARATOR_regGAME_data0_OutBus = 8'b00111100;
	end
	// Número 2 Pass_1-State //
	else if (CC_SCREENCOMPARATOR_state_data_InBus == 3'b110 && CC_SCREENCOMPARATOR_level_data_InBus==3'b010)
	begin
		CC_SCREENCOMPARATOR_regGAME_data7_OutBus = 8'b00111100;
		CC_SCREENCOMPARATOR_regGAME_data6_OutBus = 8'b01100110;
		CC_SCREENCOMPARATOR_regGAME_data5_OutBus = 8'b00000010;
		CC_SCREENCOMPARATOR_regGAME_data4_OutBus = 8'b00000110;
		CC_SCREENCOMPARATOR_regGAME_data3_OutBus = 8'b00001100;
		CC_SCREENCOMPARATOR_regGAME_data2_OutBus = 8'b00011000;
		CC_SCREENCOMPARATOR_regGAME_data1_OutBus = 8'b00110010;
		CC_SCREENCOMPARATOR_regGAME_data0_OutBus = 8'b01111110;
	end
	// Número 3 Pass_1-State //
	else if (CC_SCREENCOMPARATOR_state_data_InBus == 3'b110 && CC_SCREENCOMPARATOR_level_data_InBus==3'b011)
	begin
		CC_SCREENCOMPARATOR_regGAME_data7_OutBus = 8'b00111100;
		CC_SCREENCOMPARATOR_regGAME_data6_OutBus = 8'b01100110;
		CC_SCREENCOMPARATOR_regGAME_data5_OutBus = 8'b00000110;
		CC_SCREENCOMPARATOR_regGAME_data4_OutBus = 8'b00001100;
		CC_SCREENCOMPARATOR_regGAME_data3_OutBus = 8'b00000110;
		CC_SCREENCOMPARATOR_regGAME_data2_OutBus = 8'b00000110;
		CC_SCREENCOMPARATOR_regGAME_data1_OutBus = 8'b01100110;
		CC_SCREENCOMPARATOR_regGAME_data0_OutBus = 8'b00111100;
	end
	// Número 4 Pass_1-State //
	else if (CC_SCREENCOMPARATOR_state_data_InBus == 3'b110 && CC_SCREENCOMPARATOR_level_data_InBus==3'b100)
	begin
		CC_SCREENCOMPARATOR_regGAME_data7_OutBus = 8'b00001100;
		CC_SCREENCOMPARATOR_regGAME_data6_OutBus = 8'b00001100;
		CC_SCREENCOMPARATOR_regGAME_data5_OutBus = 8'b01111110;
		CC_SCREENCOMPARATOR_regGAME_data4_OutBus = 8'b01111110;
		CC_SCREENCOMPARATOR_regGAME_data3_OutBus = 8'b01000100;
		CC_SCREENCOMPARATOR_regGAME_data2_OutBus = 8'b01100100;
		CC_SCREENCOMPARATOR_regGAME_data1_OutBus = 8'b00110100;
		CC_SCREENCOMPARATOR_regGAME_data0_OutBus = 8'b00011100;
	end
	//================
	//-- Obstacúlos --
	//================
	else if (CC_SCREENCOMPARATOR_state_data_InBus == 3'b100 && CC_SCREENCOMPARATOR_level_data_InBus==3'b001)
	// Nivel 1 //
	begin
		CC_SCREENCOMPARATOR_regGAME_data7_OutBus = 8'b11101111;
		CC_SCREENCOMPARATOR_regGAME_data6_OutBus = 8'b00000000;
		CC_SCREENCOMPARATOR_regGAME_data5_OutBus = 8'b11000000;
		CC_SCREENCOMPARATOR_regGAME_data4_OutBus = 8'b00000011;
		CC_SCREENCOMPARATOR_regGAME_data3_OutBus = 8'b00000000;
		CC_SCREENCOMPARATOR_regGAME_data2_OutBus = 8'b01100000;
		CC_SCREENCOMPARATOR_regGAME_data1_OutBus = 8'b00000000;
		CC_SCREENCOMPARATOR_regGAME_data0_OutBus = 8'b00000000;
	end
	// Nivel 2 //
	else if (CC_SCREENCOMPARATOR_state_data_InBus == 3'b100 && CC_SCREENCOMPARATOR_level_data_InBus==3'b010)
	begin
		CC_SCREENCOMPARATOR_regGAME_data7_OutBus = 8'b11111011;
		CC_SCREENCOMPARATOR_regGAME_data6_OutBus = 8'b00110000;
		CC_SCREENCOMPARATOR_regGAME_data5_OutBus = 8'b00111000;
		CC_SCREENCOMPARATOR_regGAME_data4_OutBus = 8'b00000000;
		CC_SCREENCOMPARATOR_regGAME_data3_OutBus = 8'b00000111;
		CC_SCREENCOMPARATOR_regGAME_data2_OutBus = 8'b00000000;
		CC_SCREENCOMPARATOR_regGAME_data1_OutBus = 8'b00011000;
		CC_SCREENCOMPARATOR_regGAME_data0_OutBus = 8'b00000000;
	end
	// Nivel 3 //
	else if (CC_SCREENCOMPARATOR_state_data_InBus == 3'b100 && CC_SCREENCOMPARATOR_level_data_InBus==3'b011)
	begin
		CC_SCREENCOMPARATOR_regGAME_data7_OutBus = 8'b11111011;
		CC_SCREENCOMPARATOR_regGAME_data6_OutBus = 8'b00000000;
		CC_SCREENCOMPARATOR_regGAME_data5_OutBus = 8'b11110001;
		CC_SCREENCOMPARATOR_regGAME_data4_OutBus = 8'b00000000;
		CC_SCREENCOMPARATOR_regGAME_data3_OutBus = 8'b11110011;
		CC_SCREENCOMPARATOR_regGAME_data2_OutBus = 8'b11100011;
		CC_SCREENCOMPARATOR_regGAME_data1_OutBus = 8'b11000111;
		CC_SCREENCOMPARATOR_regGAME_data0_OutBus = 8'b00000000;
	end
	// Nivel 4 //
	else if (CC_SCREENCOMPARATOR_state_data_InBus == 3'b100 && CC_SCREENCOMPARATOR_level_data_InBus==3'b100)
	begin
		CC_SCREENCOMPARATOR_regGAME_data7_OutBus = 8'b11011111;
		CC_SCREENCOMPARATOR_regGAME_data6_OutBus = 8'b00011100;
		CC_SCREENCOMPARATOR_regGAME_data5_OutBus = 8'b11100000;
		CC_SCREENCOMPARATOR_regGAME_data4_OutBus = 8'b00000111;
		CC_SCREENCOMPARATOR_regGAME_data3_OutBus = 8'b00000000;
		CC_SCREENCOMPARATOR_regGAME_data2_OutBus = 8'b00001100;
		CC_SCREENCOMPARATOR_regGAME_data1_OutBus = 8'b11000111;
		CC_SCREENCOMPARATOR_regGAME_data0_OutBus = 8'b00000000;
	end
end
endmodule
