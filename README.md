
## 1. Design Description ##
#### 4-BIT SISO SHIFT REGISTER ####
   Design description of SISO shift register.First we give 2 inputs to D fliflop ,one is clock, second is a serial input of bits. Now the output is connected to the input of next flipflop but the clock input is same as the first flipflop.Likewise we connect 4 flipflops to get 4 bit shift register. Register is a group of filpflops
used to store multiple bits of data.Registers play a key role in
the processor for manipulating data.
<p align="center">
  <img  src="/images/2.png">
</p>


## 2. Introduction ##

   A Shift Register can shift the bits either to the left or to the right. A Shift Register, which shifts the bit to the left, is known as "Shift left register", and it shifts the bit to the right, known as "Right left register".In SISO shift register we will get serial input that is one bit
after the other through a single data line and produces a serial
output.So in output we will get the input bits shifting through
the flipflops present in shift register.

## 3. Applications of Shift Registers ##
 
1. The main benefit of this counter is, it requires n-number of FFs evaluated to the ring counter to move a given data for producing a series of 2n states.
2. Serial in – serial out register are used for time delays.
3. Shift registers are used in computers as memory elements. All the digital systems need to store large amount of data, in an efficient manner; there we use storage elements like RAM and other type of registers.
4. Many of the digital system operations like division, multiplication are performed by using registers. The data is transferred through serial shift registers and other type.


## 4. Block Diagram of SISO Shift Register ##

<p align="center">
  <img  src="/images/1.png">
</p>

1.The circuit consists of 4 D flipflops.Every flipflop is connected to a single clock wave.As only one clock signal is
given to all the 4 flipflops this is synchronous in nature.We
know that in D filpflop for every falling clock edge the input
will be reflected near output side.

2.Initially, all the flip-flops are set in ”reset” condition i.e.
Q3 = Q2 = Q1 = Q0 = 0. If we pass the binary number 1111,
the LSB bit of the number is applied first to the Din bit. The
D3 input of the third flip flop, i.e., FF-3, is directly connected
to the serial data input D3. The output Q3 is passed to the
data input D2 of the next flip flop.

3.When the clock signal application is disabled, the outputs
Q3 Q2 Q1 Q0 = 0000. The LSB bit of the number is passed
to the data input Din, i.e., D3. We will apply the clock, and
this time the value of D3 is 1. The first flip flop, i.e., FF-3, is
set, and the word is stored in the register at the first falling
edge of the clock. Now, the stored word is 1000.

4.The next bit of the binary number, i.e., 1, is passed to the
data input D2. The second flip flop, i.e., FF-2, is set, and the
word is stored when the next negative edge of the clock hits.
The stored word is changed to 1100.The next bit of the binary number,i.e., 1, is passed to the
data input D1, and the clock is applied.The third flip flop,i.e.,
FF-1, is set, and the word is stored when the negative edge
of the clock hits again.The stored word is changed to 1110.

5.Finally stored data will be 1111 as shown in truth table and
timing diagram.

<p align="center">
  <img  src="/images/4.png">
</p>

## 5. Tool installation Details ##
   #### 1.About iverilog ####
   Icarus Verilog is a Verilog simulation and synthesis tool. It operates as a compiler, compiling source code written in Verilog (IEEE-1364) into some target format.
   #### 2.About gtkwave ####
   GTKWave is a fully featured GTK+ based wave viewer for Unix, Win32, and Mac OSX which reads LXT, LXT2, VZT, FST, and GHW files as well as standard Verilog VCD/EVCD files and allows their viewing.
   #### 3. Installing iverilog and gtkwave ####
    For Ubuntu
         $ sudo apt-get install git 
         $ sudo apt-get install iverilog 
         $ sudo apt-get install gtkwave 
   #### 4. Executing the project ####
         $   git clone https://github.com/vamsidhar32/iiitb_SISO_shift-Register
         $   cd iiitb_SISO_shift-register
         $   iverilog iiitb_SISO_Shiftregister.v iiitb_SISO_Shiftregister_tb.v
         $   ./a.out
         $   gtkwave test1.vcd
         
 ## 6. Functional Characteristics ##
       Simulation results of Shift register.
       We can observe the shifting of serial input data.
       Test bench is given according to the graph.
 
   <p align="center">
  <img  src="/images/8.png">
  </p>
   
 ## 5. Systhesis of verilog code using yosys ##
The software used to run gate level synthesis is Yosys. Yosys is a framework for Verilog RTL synthesis. It currently has extensive Verilog-2005 support and provides a basic set of synthesis algorithms for various application domains. Yosys can be adapted to perform any synthesis job by combining the existing passes (algorithms) using synthesis scripts and adding additional passes as needed by extending the Yosys C++ code base.
               
      to synthesize
      $   yosys
      $   yosys>    script yosys_run.sh
     
      o see different types of cells after synthesis
      $   yosys>    stat
      
      to generate schematics
      $   yosys>    show
      
  On running the Yosys script with our yosys_run.sh file we get the following types of cells after synthesis
  
  <p align="center">
  <img  src="/images/a1.png">
  </p>
  
  we get the following schematics of our synthesized siso shift register.
  
  <p align="center">
  <img  src="/images/a2.png">
  </p>
  
  
 ## 6. Gate level Simulation (GLS) ##
 GLS is generating the simulation output by running test bench with netlist file generated from synthesis as design under test. Netlist is logically same as RTL code, therefore, same test bench can be used for it.We perform this to verify logical correctness of the design after synthesizing it. Also ensuring the timing of the design is met.
Following are the commands to run the GLS simulation:
      
      * $ iverilog -DFUNCTIONAL -DUNIT_DELAY=#1 synth_iiitb_siso.v iiitb_siso_tb.v primitives.v sky130_fd_sc_hd.v 
      * $ ./a.out
      * $ gtkwave test1.vcd
      
   
 
 <p align="center">
  <img  src="/images/a3.png">
  </p>
  
  The gtkwave output for the netlist should match the output waveform for the RTL design file. As netlist and design code have same set of inputs and outputs, we can use the same testbench and compare the waveforms. After comparing we can observe that both are same
  
 
   
 ##  Contributors ##
    P.Vamsidhar Reddy
    Kunal Ghosh
    
 ##  Acknowledgements ##
    Kunal Ghosh, Director, VSD Corp. Pvt. Ltd.
    Madhav Rao, Associate Professor, IIIT Bangalore
 
 ##  Contact information ##
    P.Vamsidhar Reddy, imtech2020 Student, International Institute of Information Technology, Bangalore , Vamsidhar.Paluchani@iiitb.ac.in
    Kunal Ghosh, Director, VSD Corp. Pvt. Ltd. kunalghosh@gmail.com
 
 ## 10. References ## 
     https://github.com/raghavrv/verilog/blob/master/siso.v
     https://www.javatpoint.com/shift-registers-in-digital-electronics
     https://www.electronicshub.org/shift-registers/#Applications_of_Shift_Registers

 

