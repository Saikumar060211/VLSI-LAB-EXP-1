v.saikumar
212222060211
# SIMULATION AND IMPLEMENTATION OF LOGIC GATES, ADDER AND SUBTRACTOR

# AIM
To simulate and synthesis Logic Gates,Adders and Subtractor using Xilinx ISE.

# APPARATUS REQUIRED
Xilinx 14.7 Spartan6 FPGA

# PROCEDURE
```
STEP:1 Start the Xilinx navigator, Select and Name the New project.
STEP:2 Select the device family, device, package and speed.
STEP:3 Select new source in the New Project and select Verilog Module as the Source type.
STEP:4 Type the File Name and Click Next and then finish button. Type the code and save it.
STEP:5 Select the Behavioral Simulation in the Source Window and click the check syntax. STEP:6 Click the simulation to simulate the program and give the inputs and verify the outputs as per the truth table. STEP:7 Select the Implementation in the Sources Window and select the required file in the Processes Window.
STEP:8 Select Check Syntax from the Synthesize XST Process. Double Click in the Floorplan Area/IO/Logic-Post Synthesis process in the User Constraints process group. UCF(User constraint File) is obtained.
STEP:9 In the Design Object List Window, enter the pin location for each pin in the Loc column Select save from the File menu.
STEP:10 Double click on the Implement Design and double click on the Generate Programming File to create a bitstream of the design.(.v) file is converted into .bit file here.
STEP:11 Load the Bit file into the SPARTAN 6 FPGA
STEP:12 On the board, by giving required input, the LEDs starts to glow light, indicating the output.
```
# LOGIC DIAGRAM:
Logic gates:

![image](https://github.com/navaneethans/VLSI-LAB-EXPERIMENTS/assets/6987778/ee17970c-3ac9-4603-881b-88e2825f41a4)

# VERILOG CODE
```
module logic_gate(a,b,andgate,orgate,xorgate,nandgate,norgate,xnorgate,notgate);
input a,b;
output andgate,orgate,xorgate,nandgate,norgate,xnorgate,notgate;
and(andgate,a,b);
or(orgate,a,b);
xor(xorgate,a,b);
nand(nandgate,a,b);  
nor(norgate,a,b);
xnor(xnorgate,a,b);
not(notgate,a);
endmodule
```

# OUTPUT:

![Screenshot 2024-03-09 141907](https://github.com/Mohanraj7896/VLSI-LAB-EXP-1/assets/166592482/1a792b50-aa3d-4842-9adb-2c1fc999a390)

# Half adder:

# LOGIC DIAGRAM:


![image](https://github.com/navaneethans/VLSI-LAB-EXPERIMENTS/assets/6987778/0e1ecb96-0c25-4556-832b-aeeedfdfe7b9)

```
module half_adder(a,b,sum,carry);
input a,b;
output sum,carry;
xor g1(sum,a,b);
and g2(carry,a,b);
endmodule;
```

# OUTPUT:
![Screenshot 2024-03-09 135938](https://github.com/Mohanraj7896/VLSI-LAB-EXP-1/assets/166592482/f4ae9a76-b614-4efc-9ace-db34450f235b)

# Full adder:

# LOGIC DIAGRAM:

![image](https://github.com/navaneethans/VLSI-LAB-EXPERIMENTS/assets/6987778/9bb3964c-438f-469d-a3de-c1cca6f323fb)

```
module full_adder(a,b,c,sum,carry);
input a,b,c;
output sum,carry;
wire w1,w2,w3;
xor g1(w1,a,b);
and g2(w3,a,b);
and g3(w2,w1,c);
xor g4(sum,w1,c);
or g5(carry,w2,w3);
endmodule
```

OUTPUT:![Screenshot 2024-04-12 151628](https://github.com/Mohanraj7896/VLSI-LAB-EXP-1/assets/166592482/ab9b61a5-3bbd-4cae-91d6-d60f1b4dbf1b)

# Half subtractor:

# LOGIC DIAGRAM:

![image](https://github.com/navaneethans/VLSI-LAB-EXPERIMENTS/assets/6987778/731470b7-eb4e-49f8-8bb7-2994052a7184)

```
module half_subtractor(a,b,diff,borr);
input a,b;
output diff,borr;
wire w1;
xor g1(diff,a,b);
not g2(w1,a);
and g3(borr,w1,b);
endmodule
```

# OUTPUT:

![Screenshot 2024-03-09 142835](https://github.com/Mohanraj7896/VLSI-LAB-EXP-1/assets/166592482/e9837352-3764-4380-a8c8-2afd67c64fc9)

# Full subtractor:

# LOGIC DIAGRAM:

![image](https://github.com/navaneethans/VLSI-LAB-EXPERIMENTS/assets/6987778/d66f874b-c1f2-44b3-a035-7149b56430c1)


```
module full_subtractor(a,b,c,diff,borr);
input a,b,c;
output diff,borr;
wire w1,w2,w3;
xor g1(w1,a,b);
and g2(w2,~a,b);
xor g3(diff,w1,c);
and g4(w3,~w1,c);
xor g5(borr,w3,w2);
endmodule
```

# OUTPUT:

![Screenshot 2024-03-09 150000](https://github.com/Mohanraj7896/VLSI-LAB-EXP-1/assets/166592482/98028e09-3524-41b3-ac15-4fc4df5c7129)

# 8 Bit ripple carry adder:

# LOGIC DIAGRAM:

![image](https://github.com/navaneethans/VLSI-LAB-EXPERIMENTS/assets/6987778/7385a408-40a5-4203-8050-b72818622d79)


```
module fulladder(a,b,c,sum,carry);
input a,b,c;
output sum,carry;
wire [3:1]w;
xor g1(w[1],a,b);
xor g2(sum,w[1],c);
and g3(w[2],a,b);
and g4(w[3],w[1],c);
or g5(carry,w[3],w[2])
endmodule
module ripple_8adder(
input [7:0] a,
input [7:0] b,
input cin,
output [7:0] sum,
output carry );
wire [6:0]c;
fulladder FA1(a[0],b[0],cin,sum[0],c[0]);
fulladder FA2(a[1],b[1],c[0],sum[1],c[1]);
fulladder FA3(a[2],b[2],c[1],sum[2],c[2]);
fulladder FA4(a[3],b[3],c[2],sum[3],c[3]);
fulladder FA5(a[4],b[4],c[3],sum[4],c[4]);
fulladder FA6(a[5],b[5],c[4],sum[5],c[5]);
fulladder FA7(a[6],b[6],c[5],sum[6],c[6]);
fulladder FA8(a[7],b[7],c[6],sum[7],carry);
endmodule
```

OUTPUT:

![Screenshot 2024-03-12 200005](https://github.com/Mohanraj7896/VLSI-LAB-EXP-1/assets/166592482/38d39f04-b0a5-4932-8266-68dadf707af7)

# RESULT
Hence Logic Gates,Adders and Subtractor are simulated and synthesised using vivado ISE
