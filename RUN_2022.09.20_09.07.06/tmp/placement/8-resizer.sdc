###############################################################################
# Created by write_sdc
# Tue Sep 20 09:38:52 2022
###############################################################################
current_design iiitb_siso
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 65.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_input_delay 13.0000 -clock [get_clocks {clk}] -add_delay [get_ports {d}]
set_output_delay 13.0000 -clock [get_clocks {clk}] -add_delay [get_ports {q}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {q}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {d}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_fanout 10.0000 [current_design]
