onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_startButton_InLow
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_upButton_InLow
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_downButton_InLow
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_leftButton_InLow
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_rightButton_InLow
add wave -noupdate /TB_SYSTEM/random1
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/regGAME_data7_wire
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/regGAME_data6_wire
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/regGAME_data5_wire
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/regGAME_data4_wire
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/regGAME_data3_wire
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/regGAME_data2_wire
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/regGAME_data1_wire
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/regGAME_data0_wire
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {99 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 243
configure wave -valuecolwidth 80
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {199772821307 ps}
