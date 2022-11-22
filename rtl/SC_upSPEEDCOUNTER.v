/*#################################################################################
////-----SPEEDCOUNTER FROOGER 2022 - 2 SISTEMAS ELECTRONICOS DIGITALES -----////
##################################################################################*/

module SC_upSPEEDCOUNTER #(parameter upSPEEDCOUNTER_DATAWIDTH=27)(
	//////////// OUTPUTS //////////
	SC_upSPEEDCOUNTER_data_OutBUS,
	//////////// INPUTS //////////
	SC_upSPEEDCOUNTER_CLOCK_50,
	SC_upSPEEDCOUNTER_RESET_InHigh,
	SC_upSPEEDCOUNTER_upcount_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[upSPEEDCOUNTER_DATAWIDTH-1:0]	SC_upSPEEDCOUNTER_data_OutBUS;
input		SC_upSPEEDCOUNTER_CLOCK_50;
input		SC_upSPEEDCOUNTER_RESET_InHigh;
input		SC_upSPEEDCOUNTER_upcount_InLow;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [upSPEEDCOUNTER_DATAWIDTH-1:0] upSPEEDCOUNTER_Register;
reg [upSPEEDCOUNTER_DATAWIDTH-1:0] upSPEEDCOUNTER_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_upSPEEDCOUNTER_upcount_InLow == 1'b0)
		upSPEEDCOUNTER_Signal = upSPEEDCOUNTER_Register + 1'b1;
	//borrar al final
	else if (SC_upSPEEDCOUNTER_upcount_InLow == 1'b1)
		upSPEEDCOUNTER_Signal = 1'b0;
	/////////////////
	else
		upSPEEDCOUNTER_Signal = upSPEEDCOUNTER_Register;
	end
	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_upSPEEDCOUNTER_CLOCK_50, posedge SC_upSPEEDCOUNTER_RESET_InHigh)
begin
	if (SC_upSPEEDCOUNTER_RESET_InHigh  == 1'b1)
		upSPEEDCOUNTER_Register <= 0;
	else
		upSPEEDCOUNTER_Register <= upSPEEDCOUNTER_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_upSPEEDCOUNTER_data_OutBUS = upSPEEDCOUNTER_Register;

endmodule
