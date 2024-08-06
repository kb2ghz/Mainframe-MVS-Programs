
|Program | Description|
|------- |-----------|
|PRG01  | A simple two instruction MVS program w/o a SAVE area and the JCL used to assemble the program.|
|PRG02 | A simple MVS program that saves and restores the MVS SAVE area using S/370 STM/LTM instructions.|
|PRG03 |A simple MVS program that saves and restores the MVS SAVE area using the SAVE/RESTORE macros.|
|PRG04 |Bubble sort implemented in S/370 assembler language. The results are output using SNAP macros that dump a list of numbers before and after the sort operation.|
|PRG05 |This program computes the first 10 Fibonacci sequence numbers. The results are output using a SNAP macro. The program implements the recursive Fibonacci function using MACRO instructions that provide a push down stack to save data and subroutine return addresses.|
|PRG06|This program starts a sub-task using the MVS IDENTIFY and ATTACH macros. The start and stopping of the sub task verified with WTO messages output by the main task and sub task.|
|PRG07|	This is a basic TSO application that sends a message to a terminal. The assembler language source and the JCL used to assemble the program is provided in two files: PRG07.ASM and PRG07.JCL.|
|MKMACLIB.JCL| This JCL job is used to create a custom MACRO library used by some of the assembler examples in this repo.|
|ICKDSF.JCL| This JCL job is used to format virtual disk drives created by the dasdinit utility provided with with Hercules and MVS 3.8j.|
  
