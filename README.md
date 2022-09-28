
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
  <img  src="/images/v1(1).png">
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
  
  The gtkwave output for the netlist should match the output waveform for the RTL design file. As netlist and design code have same set of inputs and outputs, we can use the same testbench and compare the waveforms. After comparing we can observe that both are same.
  
  
 ## Layout ##
 
  
 #### OpenLane ####
 OpenLane is an automated RTL to GDSII flow based on several components including OpenROAD, Yosys, Magic, Netgen, CVC, SPEF-Extractor, CU-GR, Klayout and a number of custom scripts for design exploration and optimization. The flow performs full ASIC implementation steps from RTL all the way down to GDSII.
more at https://github.com/The-OpenROAD-Project/OpenLane.

#### Installation instructions ####
```
$   apt install -y build-essential python3 python3-venv python3-pip
```
#### Docker installation process ####
```
$ sudo apt-get remove docker docker-engine docker.io containerd runc (removes older version of docker if installed)

$ sudo apt-get update

$ sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
$ sudo mkdir -p /etc/apt/keyrings

$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
$ sudo apt-get update

$ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

$ apt-cache madison docker-ce (copy the version string you want to install)

$ sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io docker-compose-plugin (paste the version string copies in place of <VERSION_STRING>)

$ sudo docker run hello-world (If the docker is successfully installed u will get a success message here)
```

Go to Home directory :
```
$   git clone https://github.com/The-OpenROAD-Project/OpenLane.git
$   cd OpenLane/
$   sudo make
$   sudo make test
```
OpenLane is installed successfully.

## Magic ##
Magic is a venerable VLSI layout tool, written in the 1980's at Berkeley by John Ousterhout, now famous primarily for writing the scripting interpreter language Tcl. Due largely in part to its liberal Berkeley open-source license, magic has remained popular with universities and small companies. The open-source license has allowed VLSI engineers with a bent toward programming to implement clever ideas and help magic stay abreast of fabrication technology. However, it is the well thought-out core algorithms which lend to magic the greatest part of its popularity. Magic is widely cited as being the easiest tool to use for circuit layout, even for people who ultimately rely on commercial tools for their product design flow.
More about magic at http://opencircuitdesign.com/magic/index.html

### Run the following commands one by one to install magic successfully ###
```
$   sudo apt-get install m4
$   sudo apt-get install tcsh
$   sudo apt-get install csh
$   sudo apt-get install libx11-dev
$   sudo apt-get install tcl-dev tk-dev
$   sudo apt-get install libcairo2-dev
$   sudo apt-get install mesa-common-dev libglu1-mesa-dev
$   sudo apt-get install libncurses-layout without sky130_vsdinvdev
```
### Installing Magic ###
```
$   git clone https://github.com/RTimothyEdwards/magic
$   cd magic/
$   ./configure
$   sudo make
$   sudo make install
```

The above commands should be done in home directory.

## Generating Layout with existing library cells ##

terminal should be in home directory
```
cd OpenLane/
$   cd designs/
$   mkdir iiitb_siso
$   cd iiitb_siso/
$   touch config.json
$   mkdir src
$   cd src/
$   touch iiitb_siso.v
```
After creating those files,copy the iiitb_counter.v file used prior to the one created in src.

config.json file should be as follows.
```
{
    "DESIGN_NAME": "iiitb_siso",
    "VERILOG_FILES": "dir::src/iiitb_siso.v",
    "CLOCK_PORT": "clk",
    "CLOCK_NET": "clk",
    "GLB_RESIZER_TIMING_OPTIMIZATIONS": true,
    "CLOCK_PERIOD": 65,
    "PL_RANDOM_GLB_PLACEMENT" :1,
    "PL_TARGET_DENSITY": 0.5,
    "FP_SIZING" : "relative",
    "pdk::sky130*": {
        "FP_CORE_UTIL": 5,
        "scl::sky130_fd_sc_hd": {
            "FP_CORE_UTIL": 5
        }
    },
    
    "LIB_SYNTH": "dir::src/sky130_fd_sc_hd__typical.lib",
    "LIB_FASTEST": "dir::src/sky130_fd_sc_hd__fast.lib",
    "LIB_SLOWEST": "dir::src/sky130_fd_sc_hd__slow.lib",
    "LIB_TYPICAL": "dir::src/sky130_fd_sc_hd__typical.lib",  
    "TEST_EXTERNAL_GLOB": "dir::../iiitb_siso/src/*"


}
```
 Going back to OpenLAne Directory and doing following commands .
 ```
 $   sudo make mount
%   ./flow.tcl -design iiitb_siso


To view the layout we are using magic

$   cd OpenLane/designs/iiitb_siso/runs/RUN_2022.09.20_06.52.16/results/final/def
$   magic -T /home/vamsidhar/Desktop/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech read ../../../tmp/merged.nom.lef def read iiitb_siso.def &

```
<p align="center">
  <img  src="/images/z2.png">
  </p>

Layout will open in new window as follows.
##### This is layout without vsdinv #####
<p align="center">
  <img  src="/images/z1.png">
  </p>
  
  
 ## Customizing the layout ##
 
 ##### sky130_vsdinv cell creation #####
 
 Lets design a custom cell and include in library and get it in final layout. clone the vsdcelldesign repo using following command
 ```
 $ git clone https://github.com/nickson-jose/vsdstdcelldesign
 
 copy sky130A.tech to vsdstdcelldesign directory and run the following command
 
 $ magic -T sky130A.tech sky130_inv.mag 
 ```
 
 ### Layout of Inverter cell ###
 <p align="center">
  <img  src="/images/x1.png">
  </p>
  
 Now, to extract the spice netlist, type the following commands in the tcl console. Here, parasitic capacitances and resistances of the inverter is extracted by
 cthresh 0 rthresh 0.
 
 ```
extract all
ext2spice cthresh 0 rthresh 0
ext2spice
 ```
  ### Layout of Inverter cell ###
 <p align="center">
  <img  src="/images/x2.png">
  </p>
  
  ###### Generating lef file ######
  Type the following command in tikon terminal 
  ```
  % lef write sky130_vsdinv
  ```
  
  <p align="center">
  <img  src="/images/x3.png">
  </p>
  
  Extracted lef file will be as shown below 
  
  ```
  VERSION 5.7 ;
  NOWIREEXTENSIONATPIN ON ;
  DIVIDERCHAR "/" ;
  BUSBITCHARS "[]" ;
MACRO sky130_inv
  CLASS CORE ;
  FOREIGN sky130_inv ;
  ORIGIN 0.000 0.000 ;
  SIZE 1.380 BY 2.720 ;
  SITE unithd ;
  PIN A
    DIRECTION INPUT ;
    USE SIGNAL ;
    ANTENNAGATEAREA 0.165600 ;
    PORT
      LAYER li1 ;
        RECT 0.060 1.180 0.510 1.690 ;
    END
  END A
  PIN Y
    DIRECTION OUTPUT ;
    USE SIGNAL ;
    ANTENNADIFFAREA 0.287800 ;
    PORT
      LAYER li1 ;
        RECT 0.760 1.960 1.100 2.330 ;
        RECT 0.880 1.690 1.050 1.960 ;
        RECT 0.880 1.180 1.330 1.690 ;
        RECT 0.880 0.760 1.050 1.180 ;
        RECT 0.780 0.410 1.130 0.760 ;
    END
  END Y
  PIN VPWR
    DIRECTION INOUT ;
    USE POWER ;
    PORT
      LAYER nwell ;
        RECT -0.200 1.140 1.570 3.040 ;
      LAYER li1 ;
        RECT -0.200 2.580 1.430 2.900 ;
        RECT 0.180 2.330 0.350 2.580 ;
        RECT 0.100 1.970 0.440 2.330 ;
      LAYER mcon ;
        RECT 0.230 2.640 0.400 2.810 ;
        RECT 1.000 2.650 1.170 2.820 ;
      LAYER met1 ;
        RECT -0.200 2.480 1.570 2.960 ;
    END
  END VPWR
  PIN VGND
    DIRECTION INOUT ;
    USE GROUND ;
    PORT
      LAYER li1 ;
        RECT 0.100 0.410 0.450 0.760 ;
        RECT 0.150 0.210 0.380 0.410 ;
        RECT 0.000 -0.150 1.460 0.210 ;
      LAYER mcon ;
        RECT 0.210 -0.090 0.380 0.080 ;
        RECT 1.050 -0.090 1.220 0.080 ;
      LAYER met1 ;
        RECT -0.110 -0.240 1.570 0.240 ;
    END
  END VGND
END sky130_inv
END LIBRARY

  ```
Copy the generated lef file and the lib files from vsdcelldesign/libs to designs/iiit_siso/src.

<p align="center">
  <img  src="/images/x4.png">
  </p>


 ## Layout with costum made sky130_vsdinv ## 
 Navigate to the OpenLane folder in the terminal and write the following commands.
 ```
$ sudo make mount
$ ./flow.tcl -interactive

% package require openlane 0.9

% prep -design iiitb_freqdiv

% set lefs [glob $::env(DESIGN_DIR)/src/*.lef]
% add_lefs -src $lefs


 ```
 
 <p align="center">
  <img  src="/images/m1.png">
  </p>
  
Now, we can observe that the sky130_vsdinv is included in merged.nom.lef file.

<p align="center">
  <img  src="/images/m2.png">
  </p>
  
 ### Synthesis ###
 Logic synthesis uses the RTL netlist to perform HDL technology mapping. The synthesis process is normally performed in two major steps:
  * GTECH Mapping – Consists of mapping the HDL netlist to generic gates what are used to perform logical optimization based on AIGERs and other topologies created from the generic mapped netlist.
  * Technology Mapping – Consists of mapping the post-optimized GTECH netlist to standard cells described in the PDK.
  
  To synthesize run the command
  
  ```
  % run_synthesis
  ```
  
  The stats are present in synthesized netlist in results folder.
  <p align="center">
  <img  src="/images/m3.png">
  </p>
  
  Also, sta report post synthesis can be viewed by going to the location logs\synthesis\2-sta.log
  <p align="center">
  <img  src="/images/m4.png">
  </p>
  
  
  ## Floor Planning ## 
  The following command should be used.
  
  ```
  % run_floorplan
  ```
  
  <p align="center">
  <img  src="/images/l0.png">
  </p>
  
  Run the following command in results/floorplan directory
  ```
  magic -T /home/vamsidhar/Desktop/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech read ../../tmp/merged.nom.lef def read iiitb_siso.def &

  ```
  <p align="center">
  <img  src="/images/l1.png">
  </p>
  
  Die Area and Core Area can be viewed in the reports/floorplan directory.
  <p align="center">
  <img  src="/images/l2.png">
  </p>
  
  
  ## Placement ##
  Use the following command for placement
  ```
  % run_placement
  ```
  <p align="center">
  <img  src="/images/p0.png">
  </p>
  
  Layout after placement
  Run the following command in results/placement directory
  ```
  magic -T /home/vamsidhar/Desktop/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech read ../../tmp/merged.nom.lef def read iiitb_siso.def &

  ```
   <p align="center">
  <img  src="/images/p1.png">
  </p>
  
   <p align="center">
  <img  src="/images/p2.png">
  </p>
   <p align="center">
  <img  src="/images/p3.png">
  </p>
  
  
  # CTS #
  
  Clock tree synteshsis is used to create the clock distribution network that is used to deliver the clock to all sequential elements. The main goal is to create a network with minimal skew across the chip. H-trees are a common network topology that is used to achieve this goal.

run the following command to perform CTS
```
% run_cts
```

<p align="center">
  <img  src="/images/c1.png">
  </p>
  
  
 ## Routing ## 
 Run the following command to run the routing.
 ```
 % run_routing
 ```
  <p align="center">
  <img  src="/images/r1.png">
  </p>
  
  Layout After routing
  Run the following command in results/routing directory
  ```
  
   magic -T /home/vamsidhar/Desktop/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech read ../../tmp/merged.nom.lef def read iiitb_siso.def &

  ```
  
   <p align="center">
  <img  src="/images/r2.png">
  </p>
  
   <p align="center">
  <img  src="/images/r3.png">
  </p>
  
  We Should locate vsdinv using cell manager.
  But for our siso design vsdinv is not required.
  
   <p align="center">
  <img  src="/images/r4.png">
  </p>
  
   <p align="center">
  <img  src="/images/r5.png">
  </p>
  
  # Results #
  
  ### Post synthesis gate count ###
  
  <p align="center">
  <img  src="/images/mq2.png">
  </p>
  
  ```
   Gate Count = 4 ;
  
  ```
  
  ### Area ###
  <p align="center">
  <img  src="/images/mq3.png">
  </p>
  
  ```
  Area of the chip is 2139.093 sq micrometers
  ```
  
  ### Performance ###
  
  ```
OpenSTA> read_liberty -min /home/vamsidhar/Desktop/OpenLane/pdks/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ff_n40C_1v56.lib

OpenSTA> read_liberty -max /home/vamsidhar/Desktop/OpenLane/pdks/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ff_n40C_1v56.lib

OpenSTA> read_verilog /home/vamsidhar/Desktop/OpenLane/designs/iiitb_siso/runs/RUN_2022.09.28_04.24.17/results/cts/iiitb_siso.v

OpenSTA> link_design iiitb_siso

OpenSTA> read_sdc /home/vamsidhar/Desktop/OpenLane/designs/iiitb_siso/runs/RUN_2022.09.28_04.24.17/results/cts/iiitb_siso.sdc

OpenSTA> set_propagated_clock [all_clocks]

OpenSTA> report_checks


%	report_checks -from _2_ -to _3_

  
  
  
   <p align="center">
  <img  src="/images/perform1.png">
  </p>
  
  ```
  
  This is the performance from reg to reg i.e from flipflop 2 to flipflop 3.
  Performance = 1/(clock period - slack) 
             = 1/(65.00 - 64.32)ns = 
             = 1.47 Ghz 
  
  ```
  
  
  
  ```
$ sta
 
OpenSTA> read_liberty -max /home/vamsidhar/Desktop/OpenLane/designs/iiitb_siso/src/sky130_fd_sc_hd__fast.lib

OpenSTA> read_liberty -max /home/vamsidhar/Desktop/OpenLane/designs/iiitb_siso/src/sky130_fd_sc_hd__slow.lib

OpenSTA> read_verilog /home/vamsidhar/Desktop/OpenLane/designs/iiitb_siso/runs/RUN_2022.09.28_04.24.17/results/routing/iiitb_siso.resized.v

OpenSTA> link_design iiitb_siso

OpenSTA> read_sdc /home/vamsidhar/Desktop/OpenLane/designs/iiitb_siso/runs/RUN_2022.09.28_04.24.17/results/cts/iiitb_siso.sdc

OpenSTA> read_spef /home/vamsidhar/Desktop/OpenLane/designs/iiitb_siso/runs/RUN_2022.09.28_04.24.17/results/routing/iiitb_siso.nom.spef

OpenSTA> set_propagated_clock [all_clocks]

OpenSTA> report_checks

  ```
  
  
   <p align="center">
  <img  src="/images/per2.png">
  </p>
  
   <p align="center">
  <img  src="/images/per1.png">
  </p>
   
  ```
  Performance = 1/(clock period - slack) = 1/(65.00 - 50.27)ns =  67.888 Mhz
  ```
  
  ### Flipflop to standard cell ratio ###
  
   <p align="center">
  <img  src="/images/mq5.png">
  </p>
  
  flipflop to standard cell ratio is given by :
  ```
  total number of flipflops / total number of cells = 4/4
  
  fliflop to cell ratio = 1 
  
  ```
  
  ### Power ###
  <p align="center">
  <img  src="/images/mq6.png">
  </p>
  
  
 Internal Power = 10.5 uW (87.0%) </b></I><br>
 Switching Power = 1.57 uW (13.0%) </b></I><br>
 Leakage Power = 0.174 nW (0.00%) </b></I><br>
 Total Power = 12.2 uW (100%) </b></I><br>
 
  
  
  
  
  
  
  
  
  
   
  
  
 
 
  
  

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

 

