# read design

read_verilog iiitb_SISO_Shiftregister.v

# generic synthesis
synth -top siso 

# mapping to mycells.lib
dfflibmap -liberty /home/vamsidhar/Desktop/asicdesign/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty /home/vamsidhar/Desktop/asicdesign/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
clean
flatten
# write synthesized design
write_verilog -noattr synth_iiitb_SISO_Shiftregister.v
