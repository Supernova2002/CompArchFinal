# CompArchFinal
To implement the idea of an 8 bit computer, we first had to implement an ISA. We decided early on that we wanted to follow a design similar to the Ottobit CPU. Therefore, we decided to use a 16 bit instruction length, with 3 bit register addressing and a 3 bit opcode. To do this, we began with Professor Marano's MIPS single cycle 32 bit cpu code, and attempted to pare it down to 8 bits with a smaller instruction length and addressing width. Below you will find datapath and control diagrams for the general case and for each of the 3 operation types. As we were unable to get the CPU to work, having trouble with minor errors at the end of the project, we have included sample code and the theoretical timing diagrams for this code if it were to be run.

The only files that should be used are in the fixedFile folder. These are the mips_test.sv file, which is run by running clean.bat, compile.bat, and then display.bat, in that order. This will utilize the memfile.dat file. The assembler.py is incomplete but included due to significant progress being made on it in the hopes of credit.

![image](https://user-images.githubusercontent.com/38709917/168491497-818d51da-2a32-4af2-8163-f6bd138633d0.png)
![image](https://user-images.githubusercontent.com/38709917/168491518-1eccc44f-420f-46e3-a463-1e0e23fd22e8.png)

R type operations are the simplest to handle. The opcode is simply 000, so once the control unit sees that, it passes on the function  to the alu, which then performs the operation denoted in the two source registers and stores the result in the destination register.
![image](https://user-images.githubusercontent.com/38709917/168491536-6f74e0a3-f978-4419-b288-65a839cb0ff4.png)

This is a J type operation. The opcode for this is 101, this jumps the PC to that point in memory.
![image](https://user-images.githubusercontent.com/38709917/168492324-63a10723-6691-46bc-b898-b7e9516a61a1.png)

This is an I type operation. The specific opcode for this one is 101, which is used to set a flag.



Now we move onto the timing diagrams.


![image](https://user-images.githubusercontent.com/38709917/168493561-58ad00cd-aee7-42c2-a726-e327e0de0558.png)

Each instruction type is expected to have the same timing diagram. On the positive edge, the instruction is read from memory in the first clock cycle. Then the instruction is decoded, or essentially parsed into its parts on the negative edge of the second clock cycle. On third clock cycle’s positive edge, the ALU operation is performed. On the fourth cycle’s positive edge, we load the data back into the data memory and then we write it back into the register on the fourth cycle’s negative edge. On the fifth cycle’s positive edge the data in the register is loaded again. 


Branching Algorithm: 

 

In C: 

 

if (g < h): 

f = g + h 

else  

f = g & h 

 

In Assembly: 

 

Let g = X0, h = X1, f = X2 

 

SLT X3 X0 X1 

CBZ Else 

ADD X2 X0 X1 

Else: 

AND X2 X0 X1  

 

 

In Machine Code: 

 

011 011 000 001 

110 Else 

000 010 000 001 

 

Else: 

001 010 000 001 

 

 

Simple Code to Execute  

 

In C: 

 

f = g + h 

 

Let f = X1 g = X0 h = X2 

 

ADD X1 X0 X2 

 

TO MACHINE CODE: 

000 001 000 010 

 

 

To simulate the machine code, we first load it into memfile.dat, where it should be accessed by the instruction memory (IMEM). 
