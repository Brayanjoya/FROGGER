/*#################################################################################
///-----WINCOMPARATOR: FROOGER 2022 - 2 SISTEMAS ELECTRONICOS DIGITALES -----///
##################################################################################*/

module CC_WINCOMPARATOR (
//////////// OUTPUTS //////////
	CC_WINCOMPARATOR_OutLow,
//////////// INPUTS //////////
	CC_WINCOMPARATOR_BACKGMATRIX_data7_InBus
);

//=======================================================
//  PARAMETER declarations
//=======================================================
parameter NUMBER_DATAWIDTH = 8;
//=======================================================
//  PORT declarations
//=======================================================
 
output  reg CC_WINCOMPARATOR_OutLow;
input 	[NUMBER_DATAWIDTH-1:0] CC_WINCOMPARATOR_BACKGMATRIX_data7_InBus;

//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================


always @(CC_WINCOMPARATOR_BACKGMATRIX_data7_InBus)
begin

	if (CC_WINCOMPARATOR_BACKGMATRIX_data7_InBus == 8'b11111111)
		CC_WINCOMPARATOR_OutLow = 1'b0;
	else 
		CC_WINCOMPARATOR_OutLow = 1'b1;
		
end

endmodule
