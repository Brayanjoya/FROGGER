
module SC_LEVELCOUNTER #(parameter levelcounter_DATAWIDTH=3)(
	//////////// OUTPUTS //////////
	SC_levelcounter_data_OutBus,
	//////////// INPUTS //////////
	SC_levelcounter_CLOCK_50,
	SC_levelcounter_RESET_InHigh,
	SC_levelcounter_count_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[levelcounter_DATAWIDTH-1:0]	SC_levelcounter_data_OutBus;
input		SC_levelcounter_CLOCK_50;
input		SC_levelcounter_RESET_InHigh;
input		SC_levelcounter_count_InLow;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [levelcounter_DATAWIDTH-1:0] levelcounter_Register;
reg [levelcounter_DATAWIDTH-1:0] levelcounter_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_levelcounter_count_InLow == 1'b0)
		levelcounter_Signal = levelcounter_Register + 1'b1;
	else
		levelcounter_Signal = levelcounter_Register;
	end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_levelcounter_CLOCK_50, posedge SC_levelcounter_RESET_InHigh)
begin
	if (SC_levelcounter_RESET_InHigh  == 1'b1)
		levelcounter_Register <= 0;
	else
		levelcounter_Register <= levelcounter_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_levelcounter_data_OutBus = levelcounter_Register;

endmodule 
