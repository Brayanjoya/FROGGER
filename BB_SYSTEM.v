
//=======================================================
//  MODULE Definition
//=======================================================
module BB_SYSTEM (
//////////// OUTPUTS //////////
	BB_SYSTEM_display_OutBUS,
	BB_SYSTEM_max7219DIN_Out,
	BB_SYSTEM_max7219NCS_Out,
	BB_SYSTEM_max7219CLK_Out,

	BB_SYSTEM_startButton_Out, 
	BB_SYSTEM_upButton_Out,
	BB_SYSTEM_downButton_Out,
	BB_SYSTEM_leftButton_Out,
	BB_SYSTEM_rightButton_Out,
	BB_SYSTEM_TEST0,
	BB_SYSTEM_TEST1,
	BB_SYSTEM_TEST2,

//////////// INPUTS //////////
	BB_SYSTEM_CLOCK_50,
	BB_SYSTEM_RESET_InHigh,
	BB_SYSTEM_startButton_InLow, 
	BB_SYSTEM_upButton_InLow,
	BB_SYSTEM_downButton_InLow,
	BB_SYSTEM_leftButton_InLow,
	BB_SYSTEM_rightButton_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter NOT_MOTION = 1'b1;
parameter DATAWIDTH_BUS = 8;
parameter PRESCALER_DATAWIDTH = 27;
parameter DISPLAY_DATAWIDTH = 12;
 
parameter DATA_FIXED_INITREGPOINT_7 = 8'b00000000;
parameter DATA_FIXED_INITREGPOINT_6 = 8'b00000000;
parameter DATA_FIXED_INITREGPOINT_5 = 8'b00000000;
parameter DATA_FIXED_INITREGPOINT_4 = 8'b00000000;
parameter DATA_FIXED_INITREGPOINT_3 = 8'b00000000;
parameter DATA_FIXED_INITREGPOINT_2 = 8'b00000000;
parameter DATA_FIXED_INITREGPOINT_1 = 8'b00000000;
parameter DATA_FIXED_INITREGPOINT_0 = 8'b00010000;
 
 
//=======================================================
//  PORT declarations
//=======================================================
output		[DISPLAY_DATAWIDTH-1:0] BB_SYSTEM_display_OutBUS;

output		BB_SYSTEM_max7219DIN_Out;
output		BB_SYSTEM_max7219NCS_Out;
output		BB_SYSTEM_max7219CLK_Out;

output 		BB_SYSTEM_startButton_Out;
output 		BB_SYSTEM_upButton_Out;
output 		BB_SYSTEM_downButton_Out;
output 		BB_SYSTEM_leftButton_Out;
output 		BB_SYSTEM_rightButton_Out;
output 		BB_SYSTEM_TEST0;
output 		BB_SYSTEM_TEST1;
output 		BB_SYSTEM_TEST2;

input		BB_SYSTEM_CLOCK_50;
input		BB_SYSTEM_RESET_InHigh;
input		BB_SYSTEM_startButton_InLow;
input		BB_SYSTEM_upButton_InLow;
input		BB_SYSTEM_downButton_InLow;
input		BB_SYSTEM_leftButton_InLow;
input		BB_SYSTEM_rightButton_InLow;
//=======================================================
//  REG/WIRE declarations
//=======================================================
// BUTTONs
wire 	BB_SYSTEM_startButton_InLow_cwire;
wire 	BB_SYSTEM_upButton_InLow_cwire;
wire 	BB_SYSTEM_downButton_InLow_cwire;
wire 	BB_SYSTEM_leftButton_InLow_cwire;
wire 	BB_SYSTEM_rightButton_InLow_cwire;

//POINT
wire  STATEMACHINEPOINT_delfaultscreen_cwire;
wire	STATEMACHINEPOINT_clear_cwire;
wire	STATEMACHINEPOINT_load0_cwire;
wire	STATEMACHINEPOINT_load1_cwire;
wire	[1:0] STATEMACHINEPOINT_shiftselection_cwire;


wire  [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data7_Out;
wire  [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data6_Out;
wire  [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data5_Out;
wire  [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data4_Out;
wire  [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data3_Out;
wire  [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data2_Out;
wire  [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data1_Out;
wire  [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data0_Out;

wire [2:0] positionYCOUNTER_data_OutBus_cwire;

//GAME PRINCIPAL
wire 	TIMECOMPARATOR_2_STATEMACHINEGAME_T0_cwire;
wire  STATEMACHINEGAME_timeCounter_OutLow_cwire;
wire  WINCOMPARATOR_OutLow_cwire;
wire  COLLITIONCOMPARATOR_OutLow_cwire;

wire  STATEMACHINEGAME_load_cwire;
wire  STATEMACHINEGAME_upcount_cwire;
wire  [1:0] STATEMACHINEGAME_shiftselection_cwire;
wire  [2:0] levelcounter_data_OutBus_cwire;
wire  [23:0] TIMECOUNTER_data_OutBUS_cwire;
wire  [2:0] STATEMACHINEGAME_state_data_OutBus_cwire;
wire  [1:0] STATEMACHINEGAME_levelcounter_OutLow_cwire;
wire  [1:0] STATEMACHINEGAME_ShiftSelection2_OutBus_cwire;
wire  [1:0] STATEMACHINEGAME_ShiftSelection1_OutBus_cwire;

wire  [23:0] TIMECOUNTER_data_BUS_wire;

wire  SCREENCOMPARATOR_load_cwire;

//BACKGROUNG
wire  [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data7_Out;
wire  [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data6_Out;
wire  [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data5_Out;
wire  [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data4_Out;
wire  [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data3_Out;
wire  [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data2_Out;
wire  [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data1_Out;
wire  [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data0_Out;

wire  SPEEDCOMPARATOR_2_STATEMACHINEGAME_T0_cwire;
wire  [PRESCALER_DATAWIDTH-1:0] upSPEEDCOUNTER_data_BUS_wire;

wire  HOME_load_cwire;

wire  [DATAWIDTH_BUS-1:0] DATA_FIXED_INITREGBACKG_7_wire;
wire  [DATAWIDTH_BUS-1:0] DATA_FIXED_INITREGBACKG_6_wire;
wire  [DATAWIDTH_BUS-1:0] DATA_FIXED_INITREGBACKG_5_wire;
wire  [DATAWIDTH_BUS-1:0] DATA_FIXED_INITREGBACKG_4_wire;
wire  [DATAWIDTH_BUS-1:0] DATA_FIXED_INITREGBACKG_3_wire;
wire  [DATAWIDTH_BUS-1:0] DATA_FIXED_INITREGBACKG_2_wire;
wire  [DATAWIDTH_BUS-1:0] DATA_FIXED_INITREGBACKG_1_wire;
wire  [DATAWIDTH_BUS-1:0] DATA_FIXED_INITREGBACKG_0_wire;

//BOTTOMSIDE COMPARATOR
wire  BOTTOMSIDECOMPARATOR_bottomside_cwire;

// GAME
wire  [DATAWIDTH_BUS-1:0] regGAME_data7_wire;
wire  [DATAWIDTH_BUS-1:0] regGAME_data6_wire;
wire  [DATAWIDTH_BUS-1:0] regGAME_data5_wire;
wire  [DATAWIDTH_BUS-1:0] regGAME_data4_wire;
wire  [DATAWIDTH_BUS-1:0] regGAME_data3_wire;
wire  [DATAWIDTH_BUS-1:0] regGAME_data2_wire;
wire  [DATAWIDTH_BUS-1:0] regGAME_data1_wire;
wire  [DATAWIDTH_BUS-1:0] regGAME_data0_wire;

wire 	[7:0] data_max;
wire 	[2:0] add;

wire  [DATAWIDTH_BUS-1:0] upCOUNTER_2_BIN2BCD1_data_BUS_wire;
wire  [DISPLAY_DATAWIDTH-1:0] BIN2BCD1_2_SEVENSEG1_data_BUS_wire;


//=======================================================
//  Structural coding
//=======================================================

//######################################################################
//#	INPUTS
//######################################################################
SC_DEBOUNCE1 SC_DEBOUNCE1_u0 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_startButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_startButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u1 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_upButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_upButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u2 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_downButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_downButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u3 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_leftButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_leftButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u4 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_rightButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_rightButton_InLow)
);

//######################################################################
//#	POINT
//######################################################################
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_7)) SC_RegPOINTTYPE_u7 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data6_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out),
	.SC_RegPOINTTYPE_defaultscreen_InLow(STATEMACHINEPOINT_delfaultscreen_cwire),
	
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data7_Out)
	
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_6)) SC_RegPOINTTYPE_u6 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data5_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data7_Out),
	.SC_RegPOINTTYPE_defaultscreen_InLow(STATEMACHINEPOINT_delfaultscreen_cwire),
	
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data6_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_5)) SC_RegPOINTTYPE_u5 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data4_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data6_Out),
	.SC_RegPOINTTYPE_defaultscreen_InLow(STATEMACHINEPOINT_delfaultscreen_cwire),
	
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data5_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_4)) SC_RegPOINTTYPE_u4 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data3_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data5_Out),
	.SC_RegPOINTTYPE_defaultscreen_InLow(STATEMACHINEPOINT_delfaultscreen_cwire),
	
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data4_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_3)) SC_RegPOINTTYPE_u3 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data2_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data4_Out),
	.SC_RegPOINTTYPE_defaultscreen_InLow(STATEMACHINEPOINT_delfaultscreen_cwire),
	
	
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data3_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_2)) SC_RegPOINTTYPE_u2 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data1_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data3_Out),
	.SC_RegPOINTTYPE_defaultscreen_InLow(STATEMACHINEPOINT_delfaultscreen_cwire),
	
	
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data2_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_1)) SC_RegPOINTTYPE_u1 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data2_Out),
	.SC_RegPOINTTYPE_defaultscreen_InLow(STATEMACHINEPOINT_delfaultscreen_cwire),
	
	
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data1_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_0)) SC_RegPOINTTYPE_u0 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data7_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data1_Out),
	.SC_RegPOINTTYPE_defaultscreen_InLow(STATEMACHINEPOINT_delfaultscreen_cwire),
	
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out)
);

SC_STATEMACHINEPOINT SC_STATEMACHINEPOINT_u0 (
// port map - connection between master ports and signals/registers
	.SC_STATEMACHINEPOINT_levelcounter_InBus(levelcounter_data_OutBus_cwire),
	.SC_STATEMACHINEPOINT_state_InBus(STATEMACHINEGAME_state_data_OutBus_cwire),
	.SC_STATEMACHINEPOINT_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINEPOINT_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINEPOINT_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire),
	.SC_STATEMACHINEPOINT_upButton_InLow(BB_SYSTEM_upButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_downButton_InLow(BB_SYSTEM_downButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_leftButton_InLow(BB_SYSTEM_leftButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_rightButton_InLow(BB_SYSTEM_rightButton_InLow_cwire),
	.SC_STATEMACHINEPOINT_bottomsidecomparator_InLow(BOTTOMSIDECOMPARATOR_bottomside_cwire),
	
	.SC_STATEMACHINEPOINT_clear_OutLow(STATEMACHINEPOINT_clear_cwire), 
	.SC_STATEMACHINEPOINT_load0_OutLow(STATEMACHINEPOINT_load0_cwire), 
	.SC_STATEMACHINEPOINT_load1_OutLow(STATEMACHINEPOINT_load1_cwire), 
	.SC_STATEMACHINEPOINT_shiftselection_Out(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_STATEMACHINEPOINT_delfaultscreen_OutLow(STATEMACHINEPOINT_delfaultscreen_cwire)
);

SC_positionYCOUNTER SC_positionYCOUNTER_u0 (
// port map - connection between master ports and signals/registers 
	.SC_positionYCOUNTER_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_positionYCOUNTER_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_positionYCOUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_positionYCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	
	.SC_positionYCOUNTER_data_OutBUS(positionYCOUNTER_data_OutBus_cwire)
); 

//######################################################################
//#	GAME
//######################################################################

SC_STATEMACHINEGAME SC_STATEMACHINEGAME_u0 (
// port map - connection between master ports and signals/registers  
	.SC_STATEMACHINEGAME_timeComparator_InLow(TIMECOMPARATOR_2_STATEMACHINEGAME_T0_cwire),
	.SC_STATEMACHINEGAME_win_InLow(WINCOMPARATOR_OutLow_cwire),
	.SC_STATEMACHINEGAME_lose_InLow(COLLITIONCOMPARATOR_OutLow_cwire),
	.SC_STATEMACHINEGAME_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINEGAME_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINEGAME_speedComparator_InLow(SPEEDCOMPARATOR_2_STATEMACHINEGAME_T0_cwire),
	.SC_STATEMACHINEGAME_level_data_InBus(levelcounter_data_OutBus_cwire),
	.SC_STATEMACHINEGAME_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire),
		
	.SC_STATEMACHINEGAME_timeCounter_OutLow(STATEMACHINEGAME_timeCounter_OutLow_cwire),
	.SC_STATEMACHINEGAME_levelcounter_OutLow(STATEMACHINEGAME_levelcounter_OutLow_cwire),
	.SC_STATEMACHINEGAME_load_OutLow(STATEMACHINEGAME_load_cwire),
	.SC_STATEMACHINEGAME_ShiftSelection2_OutBus(STATEMACHINEGAME_ShiftSelection2_OutBus_cwire),
	.SC_STATEMACHINEGAME_ShiftSelection1_OutBus(STATEMACHINEGAME_ShiftSelection1_OutBus_cwire),
	.SC_STATEMACHINEGAME_upcount_InLow(STATEMACHINEGAME_upcount_cwire),
	.SC_STATEMACHINEGAME_state_data_OutBus(STATEMACHINEGAME_state_data_OutBus_cwire)	
);

CC_WINCOMPARATOR CC_WINCOMPARATOR_u0 (
// port map - connection between master ports and signals/registers  
	.CC_WINCOMPARATOR_BACKGMATRIX_data7_InBus(regGAME_data7_wire),

	.CC_WINCOMPARATOR_OutLow(WINCOMPARATOR_OutLow_cwire)
);

SC_LEVELCOUNTER SC_LEVELCOUNTER_u0 (
// port map - connection between master ports and signals/registers  
	.SC_levelcounter_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_levelcounter_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_levelcounter_count_InLow(STATEMACHINEGAME_levelcounter_OutLow_cwire),
	
	.SC_levelcounter_data_OutBus(levelcounter_data_OutBus_cwire)
);

SC_TIMECOUNTER SC_TIMECOUNTER_u0 (
// port map - connection between master ports and signals/registers  
	.SC_TIMECOUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_TIMECOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_TIMECOUNTER_InLow(STATEMACHINEGAME_timeCounter_OutLow_cwire),
	
	.SC_TIMECOUNTER_data_OutBUS(TIMECOUNTER_data_BUS_wire)
);

CC_TIMECOMPARATOR CC_TIMECOMPARATOR_u0 (
// port map - connection between master ports and signals/registers  
	.CC_TIMECOMPARATOR_data_InBUS(TIMECOUNTER_data_BUS_wire),
	
	.CC_TIMECOMPARATOR_T0_OutLow(TIMECOMPARATOR_2_STATEMACHINEGAME_T0_cwire)
);


CC_SCREENCOMPARATOR CC_SCREENCOMPARATOR_u0 (
// port map - connection between master ports and signals/registers  
	.CC_SCREENCOMPARATOR_regGAME_data7_InBus(regGAME_data7_wire),
	.CC_SCREENCOMPARATOR_level_data_InBus(levelcounter_data_OutBus_cwire),
	.CC_SCREENCOMPARATOR_state_data_InBus(STATEMACHINEGAME_state_data_OutBus_cwire),
	.CC_SCREENCOMPARATOR_positionYCOUNTER_data_InBus(positionYCOUNTER_data_OutBus_cwire),
	
	.CC_SCREENCOMPARATOR_regGAME_data7_OutBus(DATA_FIXED_INITREGBACKG_7_wire),
	.CC_SCREENCOMPARATOR_regGAME_data6_OutBus(DATA_FIXED_INITREGBACKG_6_wire),
	.CC_SCREENCOMPARATOR_regGAME_data5_OutBus(DATA_FIXED_INITREGBACKG_5_wire),
	.CC_SCREENCOMPARATOR_regGAME_data4_OutBus(DATA_FIXED_INITREGBACKG_4_wire),
	.CC_SCREENCOMPARATOR_regGAME_data3_OutBus(DATA_FIXED_INITREGBACKG_3_wire),
	.CC_SCREENCOMPARATOR_regGAME_data2_OutBus(DATA_FIXED_INITREGBACKG_2_wire),
	.CC_SCREENCOMPARATOR_regGAME_data1_OutBus(DATA_FIXED_INITREGBACKG_1_wire),
	.CC_SCREENCOMPARATOR_regGAME_data0_OutBus(DATA_FIXED_INITREGBACKG_0_wire),
	.CC_SCREENCOMPARATOR_load_OutLow(SCREENCOMPARATOR_load_cwire)
);


//######################################################################
//#	BACKGROUND
//######################################################################

assign HOME_load_cwire = SCREENCOMPARATOR_load_cwire && STATEMACHINEGAME_load_cwire;

SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS)) SC_RegBACKGTYPE_u7 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_InBUS(DATA_FIXED_INITREGBACKG_7_wire),
	.SC_RegBACKGTYPE_load_InLow(HOME_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(NOT_MOTION),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),

	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data7_Out)
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS)) SC_RegBACKGTYPE_u6 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_InBUS(DATA_FIXED_INITREGBACKG_6_wire),
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEGAME_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEGAME_ShiftSelection1_OutBus_cwire),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),

	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data6_Out)
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS)) SC_RegBACKGTYPE_u5 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_InBUS(DATA_FIXED_INITREGBACKG_5_wire),
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEGAME_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEGAME_ShiftSelection2_OutBus_cwire),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),

	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data5_Out)
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS)) SC_RegBACKGTYPE_u4 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_InBUS(DATA_FIXED_INITREGBACKG_4_wire),
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEGAME_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEGAME_ShiftSelection1_OutBus_cwire),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),

	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data4_Out)
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS)) SC_RegBACKGTYPE_u3 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_InBUS(DATA_FIXED_INITREGBACKG_3_wire),
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEGAME_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEGAME_ShiftSelection2_OutBus_cwire),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),

	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data3_Out)
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS)) SC_RegBACKGTYPE_u2 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_InBUS(DATA_FIXED_INITREGBACKG_2_wire),
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEGAME_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEGAME_ShiftSelection1_OutBus_cwire),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),

	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data2_Out)
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS)) SC_RegBACKGTYPE_u1 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_InBUS(DATA_FIXED_INITREGBACKG_1_wire),
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEGAME_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEGAME_ShiftSelection2_OutBus_cwire),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),

	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data1_Out)
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS)) SC_RegBACKGTYPE_u0 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_InBUS(DATA_FIXED_INITREGBACKG_0_wire),
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEGAME_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEGAME_ShiftSelection1_OutBus_cwire),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),

	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data0_Out)
);

//#COLLITION
CC_COLLITIONCOMPARATOR CC_COLLITIONCOMPARARTOR_u0 (
// port map - connection between master ports and signals/registers
	.CC_COLLITIONCOMPARATOR_BACKG_data7_InBus(RegBACKGTYPE_2_BACKGMATRIX_data7_Out),
	.CC_COLLITIONCOMPARATOR_BACKG_data6_InBus(RegBACKGTYPE_2_BACKGMATRIX_data6_Out),
	.CC_COLLITIONCOMPARATOR_BACKG_data5_InBus(RegBACKGTYPE_2_BACKGMATRIX_data5_Out),
	.CC_COLLITIONCOMPARATOR_BACKG_data4_InBus(RegBACKGTYPE_2_BACKGMATRIX_data4_Out),
	.CC_COLLITIONCOMPARATOR_BACKG_data3_InBus(RegBACKGTYPE_2_BACKGMATRIX_data3_Out),
	.CC_COLLITIONCOMPARATOR_BACKG_data2_InBus(RegBACKGTYPE_2_BACKGMATRIX_data2_Out),
	.CC_COLLITIONCOMPARATOR_BACKG_data1_InBus(RegBACKGTYPE_2_BACKGMATRIX_data1_Out),
	.CC_COLLITIONCOMPARATOR_BACKG_data0_InBus(RegBACKGTYPE_2_BACKGMATRIX_data0_Out),
	
	.CC_COLLITIONCOMPARATOR_POINT_data7_InBus(RegPOINTTYPE_2_POINTMATRIX_data7_Out),
	.CC_COLLITIONCOMPARATOR_POINT_data6_InBus(RegPOINTTYPE_2_POINTMATRIX_data6_Out),
	.CC_COLLITIONCOMPARATOR_POINT_data5_InBus(RegPOINTTYPE_2_POINTMATRIX_data5_Out),
	.CC_COLLITIONCOMPARATOR_POINT_data4_InBus(RegPOINTTYPE_2_POINTMATRIX_data4_Out),
	.CC_COLLITIONCOMPARATOR_POINT_data3_InBus(RegPOINTTYPE_2_POINTMATRIX_data3_Out),
	.CC_COLLITIONCOMPARATOR_POINT_data2_InBus(RegPOINTTYPE_2_POINTMATRIX_data2_Out),
	.CC_COLLITIONCOMPARATOR_POINT_data1_InBus(RegPOINTTYPE_2_POINTMATRIX_data1_Out),
	.CC_COLLITIONCOMPARATOR_POINT_data0_InBus(RegPOINTTYPE_2_POINTMATRIX_data0_Out),
	
	.CC_COLLITIONCOMPARATOR_Out(COLLITIONCOMPARATOR_OutLow_cwire)
);

//#SPEED
SC_upSPEEDCOUNTER #(.upSPEEDCOUNTER_DATAWIDTH(PRESCALER_DATAWIDTH)) SC_upSPEEDCOUNTER_u0 (
// port map - connection between master ports and signals/registers   
	.SC_upSPEEDCOUNTER_upcount_InLow(STATEMACHINEGAME_upcount_cwire),
	.SC_upSPEEDCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_upSPEEDCOUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	
	.SC_upSPEEDCOUNTER_data_OutBUS(upSPEEDCOUNTER_data_BUS_wire)
	
);

CC_SPEEDCOMPARATOR #(.SPEEDCOMPARATOR_DATAWIDTH(PRESCALER_DATAWIDTH)) CC_SPEEDCOMPARATOR_u0 (
// port map - connection between master ports and signals/registers   
	.CC_SPEEDCOMPARATOR_level_data_InBus(levelcounter_data_OutBus_cwire),
	.CC_SPEEDCOMPARATOR_data_InBUS(upSPEEDCOUNTER_data_BUS_wire),
	
	.CC_SPEEDCOMPARATOR_T0_OutLow(SPEEDCOMPARATOR_2_STATEMACHINEGAME_T0_cwire)
);

//######################################################################
//#	COMPARATOR END OF MATRIX (BOTTON SIDE)
//######################################################################
CC_BOTTOMSIDECOMPARATOR #(.BOTTOMSIDECOMPARATOR_DATAWIDTH(DATAWIDTH_BUS)) CC_BOTTOMSIDECOMPARATOR_u0 (
// port map - connection between master ports and signals/registers 
	.CC_BOTTOMSIDECOMPARATOR_bottomside_OutLow(BOTTOMSIDECOMPARATOR_bottomside_cwire),
	
	.CC_BOTTOMSIDECOMPARATOR_data_InBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out)
);


//######################################################################
//#	TO LED MATRIZ: VISUALIZATION
//######################################################################
assign regGAME_data0_wire = RegPOINTTYPE_2_POINTMATRIX_data0_Out | RegBACKGTYPE_2_BACKGMATRIX_data0_Out;
assign regGAME_data1_wire = RegPOINTTYPE_2_POINTMATRIX_data1_Out | RegBACKGTYPE_2_BACKGMATRIX_data1_Out;
assign regGAME_data2_wire = RegPOINTTYPE_2_POINTMATRIX_data2_Out | RegBACKGTYPE_2_BACKGMATRIX_data2_Out;
assign regGAME_data3_wire = RegPOINTTYPE_2_POINTMATRIX_data3_Out | RegBACKGTYPE_2_BACKGMATRIX_data3_Out;
assign regGAME_data4_wire = RegPOINTTYPE_2_POINTMATRIX_data4_Out | RegBACKGTYPE_2_BACKGMATRIX_data4_Out;
assign regGAME_data5_wire = RegPOINTTYPE_2_POINTMATRIX_data5_Out | RegBACKGTYPE_2_BACKGMATRIX_data5_Out;
assign regGAME_data6_wire = RegPOINTTYPE_2_POINTMATRIX_data6_Out | RegBACKGTYPE_2_BACKGMATRIX_data6_Out;
assign regGAME_data7_wire = RegPOINTTYPE_2_POINTMATRIX_data7_Out | RegBACKGTYPE_2_BACKGMATRIX_data7_Out;

assign data_max =(add==3'b000)?{regGAME_data0_wire[7],regGAME_data1_wire[7],regGAME_data2_wire[7],regGAME_data3_wire[7],regGAME_data4_wire[7],regGAME_data5_wire[7],regGAME_data6_wire[7],regGAME_data7_wire[7]}:
	       (add==3'b001)?{regGAME_data0_wire[6],regGAME_data1_wire[6],regGAME_data2_wire[6],regGAME_data3_wire[6],regGAME_data4_wire[6],regGAME_data5_wire[6],regGAME_data6_wire[6],regGAME_data7_wire[6]}:
	       (add==3'b010)?{regGAME_data0_wire[5],regGAME_data1_wire[5],regGAME_data2_wire[5],regGAME_data3_wire[5],regGAME_data4_wire[5],regGAME_data5_wire[5],regGAME_data6_wire[5],regGAME_data7_wire[5]}:
	       (add==3'b011)?{regGAME_data0_wire[4],regGAME_data1_wire[4],regGAME_data2_wire[4],regGAME_data3_wire[4],regGAME_data4_wire[4],regGAME_data5_wire[4],regGAME_data6_wire[4],regGAME_data7_wire[4]}:
	       (add==3'b100)?{regGAME_data0_wire[3],regGAME_data1_wire[3],regGAME_data2_wire[3],regGAME_data3_wire[3],regGAME_data4_wire[3],regGAME_data5_wire[3],regGAME_data6_wire[3],regGAME_data7_wire[3]}:
	       (add==3'b101)?{regGAME_data0_wire[2],regGAME_data1_wire[2],regGAME_data2_wire[2],regGAME_data3_wire[2],regGAME_data4_wire[2],regGAME_data5_wire[2],regGAME_data6_wire[2],regGAME_data7_wire[2]}:
	       (add==3'b110)?{regGAME_data0_wire[1],regGAME_data1_wire[1],regGAME_data2_wire[1],regGAME_data3_wire[1],regGAME_data4_wire[1],regGAME_data5_wire[1],regGAME_data6_wire[1],regGAME_data7_wire[1]}:
						{regGAME_data0_wire[0],regGAME_data1_wire[0],regGAME_data2_wire[0],regGAME_data3_wire[0],regGAME_data4_wire[0],regGAME_data5_wire[0],regGAME_data6_wire[0],regGAME_data7_wire[0]};
									 
matrix_ctrl matrix_ctrl_unit_0( 

	.reset(BB_SYSTEM_RESET_InHigh), //~lowRst_System
	.clk(BB_SYSTEM_CLOCK_50),
	.disp_data(data_max), 
	.disp_addr(add),
	.intensity(4'hA),

	.max7219_din(BB_SYSTEM_max7219DIN_Out),//max7219_din 
	.max7219_ncs(BB_SYSTEM_max7219NCS_Out),//max7219_ncs 
	.max7219_clk(BB_SYSTEM_max7219CLK_Out)//max7219_clk

); 
 

//######################################################################
//#	TO TEST
//######################################################################

assign BB_SYSTEM_startButton_Out = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_upButton_Out = BB_SYSTEM_upButton_InLow_cwire;
assign BB_SYSTEM_downButton_Out = BB_SYSTEM_downButton_InLow_cwire;
assign BB_SYSTEM_leftButton_Out = BB_SYSTEM_leftButton_InLow_cwire;
assign BB_SYSTEM_rightButton_Out = BB_SYSTEM_rightButton_InLow_cwire;
//TO TEST
assign BB_SYSTEM_TEST0 = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_TEST1 = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_TEST2 = BB_SYSTEM_startButton_InLow_cwire;


//######################################################################
//#	TO 7SEG
//######################################################################

CC_BIN2BCD1 CC_BIN2BCD1_u0 (
// port map - connection between master ports and signals/registers   
	.CC_BIN2BCD_bcd_OutBUS(BIN2BCD1_2_SEVENSEG1_data_BUS_wire),
	.CC_BIN2BCD_bin_InBUS(upCOUNTER_2_BIN2BCD1_data_BUS_wire)
);

CC_SEVENSEG1 CC_SEVENSEG1_u0 (
// port map - connection between master ports and signals/registers   
	.CC_SEVENSEG1_an(BB_SYSTEM_display_OutBUS[11:8]),
	.CC_SEVENSEG1_a(BB_SYSTEM_display_OutBUS[0]),
	.CC_SEVENSEG1_b(BB_SYSTEM_display_OutBUS[1]),
	.CC_SEVENSEG1_c(BB_SYSTEM_display_OutBUS[2]),
	.CC_SEVENSEG1_d(BB_SYSTEM_display_OutBUS[3]),
	.CC_SEVENSEG1_e(BB_SYSTEM_display_OutBUS[4]),
	.CC_SEVENSEG1_f(BB_SYSTEM_display_OutBUS[5]),
	.CC_SEVENSEG1_g(BB_SYSTEM_display_OutBUS[6]),
	.CC_SEVENSEG1_dp(BB_SYSTEM_display_OutBUS[7]),
	.CC_SEVENSEG1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.CC_SEVENSEG1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.CC_SEVENSEG1_in0(BIN2BCD1_2_SEVENSEG1_data_BUS_wire[3:0]),
	.CC_SEVENSEG1_in1(BIN2BCD1_2_SEVENSEG1_data_BUS_wire[7:4]),
	.CC_SEVENSEG1_in2(BIN2BCD1_2_SEVENSEG1_data_BUS_wire[11:8]),
	.CC_SEVENSEG1_in3(BIN2BCD1_2_SEVENSEG1_data_BUS_wire[11:8])
);

SC_upCOUNTER #(.upCOUNTER_DATAWIDTH(DATAWIDTH_BUS)) SC_upCOUNTER_u0 (
// port map - connection between master ports and signals/registers   
	.SC_upCOUNTER_data_OutBUS(upCOUNTER_2_BIN2BCD1_data_BUS_wire),
	.SC_upCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_upCOUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_upCOUNTER_upcount_InLow(STATEMACHINEPOINT_load0_cwire)
);

endmodule
