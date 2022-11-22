/*#################################################################################
///-----SPEEDCOMPARATOR FROOGER 2022 - 2 SISTEMAS ELECTRONICOS DIGITALES -----///
##################################################################################*/

module CC_SPEEDCOMPARATOR #(parameter SPEEDCOMPARATOR_DATAWIDTH= 27)(
//////////// OUTPUTS //////////
	CC_SPEEDCOMPARATOR_T0_OutLow,
//////////// INPUTS //////////
	CC_SPEEDCOMPARATOR_data_InBUS,
	CC_SPEEDCOMPARATOR_level_data_InBus
);

//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
 
output  reg CC_SPEEDCOMPARATOR_T0_OutLow;
input 	[SPEEDCOMPARATOR_DATAWIDTH-1:0] CC_SPEEDCOMPARATOR_data_InBUS;
input 	[2:0] CC_SPEEDCOMPARATOR_level_data_InBus;

//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================


always @(CC_SPEEDCOMPARATOR_data_InBUS, CC_SPEEDCOMPARATOR_level_data_InBus)
begin
if (CC_SPEEDCOMPARATOR_level_data_InBus == 3'b001)
	if( CC_SPEEDCOMPARATOR_data_InBUS == 27'b000111111111111111111111111)
	//valor-prueba 000000000000011111111111
	//valor-real 111101000010010000000000
		CC_SPEEDCOMPARATOR_T0_OutLow = 1'b0;
	else 
		CC_SPEEDCOMPARATOR_T0_OutLow = 1'b1;
		
if (CC_SPEEDCOMPARATOR_level_data_InBus == 3'b010)
	if( CC_SPEEDCOMPARATOR_data_InBUS == 27'b000110111110101111000010000)
		CC_SPEEDCOMPARATOR_T0_OutLow = 1'b0;
	else 
		CC_SPEEDCOMPARATOR_T0_OutLow = 1'b1;
		
if (CC_SPEEDCOMPARATOR_level_data_InBus == 3'b011)
	if( CC_SPEEDCOMPARATOR_data_InBUS == 27'b011010111111111111111111111)
		CC_SPEEDCOMPARATOR_T0_OutLow = 1'b0;
	else 
		CC_SPEEDCOMPARATOR_T0_OutLow = 1'b1;	
		
if (CC_SPEEDCOMPARATOR_level_data_InBus == 3'b100)
	if( CC_SPEEDCOMPARATOR_data_InBUS == 27'b010001001111111111111111111)
		CC_SPEEDCOMPARATOR_T0_OutLow = 1'b0;
	else 
		CC_SPEEDCOMPARATOR_T0_OutLow = 1'b1;	

		
end

endmodule

