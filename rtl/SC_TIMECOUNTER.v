/*#################################################################################
////-----SPEEDCOUNTER FROOGER 2022 - 2 SISTEMAS ELECTRONICOS DIGITALES -----////
##################################################################################*/

module SC_TIMECOUNTER #(parameter TIMECOUNTER_DATAWIDTH=24)(
	//////////// OUTPUTS //////////
	SC_TIMECOUNTER_data_OutBUS,
	//////////// INPUTS //////////
	SC_TIMECOUNTER_CLOCK_50,
	SC_TIMECOUNTER_RESET_InHigh,
	SC_TIMECOUNTER_InLow 
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[TIMECOUNTER_DATAWIDTH-1:0]	SC_TIMECOUNTER_data_OutBUS;
input		SC_TIMECOUNTER_CLOCK_50;
input		SC_TIMECOUNTER_RESET_InHigh;
input		SC_TIMECOUNTER_InLow;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [TIMECOUNTER_DATAWIDTH-1:0] timecounter_Register;
reg [TIMECOUNTER_DATAWIDTH-1:0] timecounter_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_TIMECOUNTER_InLow == 1'b0)
		timecounter_Signal = timecounter_Register + 1'b1;
	else if (SC_TIMECOUNTER_InLow == 1'b1)
		timecounter_Signal = 1'b0;
	else
		timecounter_Signal = timecounter_Register;
	end
	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_TIMECOUNTER_CLOCK_50, posedge SC_TIMECOUNTER_RESET_InHigh)
begin
	if (SC_TIMECOUNTER_RESET_InHigh  == 1'b1)
		timecounter_Register <= 0;
	else
		timecounter_Register <= timecounter_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_TIMECOUNTER_data_OutBUS = timecounter_Register;

endmodule

