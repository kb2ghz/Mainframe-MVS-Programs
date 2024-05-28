//* THIS JOB CREATES A MACRO LIBRARY FOR ASSEMBLER LANGUAGE PROGRAMMING
//*
//MKMACLIB JOB CLASS=A,MSGCLASS=H
//*
//* CREATE THE PDS FILE
//*
//MK       EXEC  PGM=IEFBR14
//MACLB    DD  DISP=(NEW,CATLG,DELETE),DSN=HERC01.MYMACLIB,
//  DCB=(BLKSIZE=8000,LRECL=80,DSORG=PO,RECFM=FB),
//  SPACE=(TRK,(1,2,10)),
//  UNIT=SYSDA
//SYSPRINT  DD SYSOUT=*
//SYSOUT    DD SYSOUT=*
//SYSDUMP   DD SYSOUT=*
//*
//* ADD REGISTER MACRO
//*
//ADDREG   EXEC PGM=IEBUPDTE
//SYSPRINT DD  SYSOUT=A
//SYSDUMP  DD  SYSOUT=A
//SYSUT1   DD  DSN=HERC01.MYMACLIB,DISP=OLD
//SYSUT2   DD  DSN=HERC01.MYMACLIB,DISP=OLD
//SYSIN    DD  DATA
./  ADD NAME=REGISTER,LIST=ALL
           MACRO
           REGISTER
R0         EQU   0
R1         EQU   1
R2         EQU   2
R3         EQU   3
R4         EQU   4
R5         EQU   5
R6         EQU   6
R7         EQU   7
R8         EQU   8
R9         EQU   9
R10        EQU   10
R11        EQU   11
R12        EQU   12
R13        EQU   13
R14        EQU   14
R15        EQU   15
           MEND
./  ENDUP
/*
//*
//* ADD PUSH REGISTER MACRO
//*
//PSHREG   EXEC PGM=IEBUPDTE
//SYSPRINT DD  SYSOUT=A
//SYSDUMP  DD  SYSOUT=A
//SYSUT1   DD  DSN=HERC01.MYMACLIB,DISP=OLD
//SYSUT2   DD  DSN=HERC01.MYMACLIB,DISP=OLD
//SYSIN    DD  DATA
./  ADD NAME=PSH,LIST=ALL
         MACRO                                                          00000600
         PSH   &REG                                                     00000700
         ST    &REG,0(,3)     STORE ELEMENT ON STACK                    00000800
         LA    3,4(3)         INCREMENT STACK POINTER                   00000900
         MEND                                                           00001000
./  ENDUP
/*
//*
//* ADD POP REGISTER MACRO
//*
//POPREG   EXEC PGM=IEBUPDTE
//SYSPRINT DD  SYSOUT=A
//SYSDUMP  DD  SYSOUT=A
//SYSUT1   DD  DSN=HERC01.MYMACLIB,DISP=OLD
//SYSUT2   DD  DSN=HERC01.MYMACLIB,DISP=OLD
//SYSIN    DD  DATA
./  ADD NAME=PLP,LIST=ALL
         MACRO                                                          00001200
         PLP   &REG                                                     00001300
         S     3,=F'4'        DECREMENT STACK POINTER                   00001400
         L     &REG,0(,3)     READ ELEMENT FROM STACK                   00001500
         MEND                                                           00001600
./  ENDUP
/*                                                                      00001700
//*
//* ADD JUMP TO SUBROUTINE MACRO
//*
//JSRMAC   EXEC PGM=IEBUPDTE
//SYSPRINT DD  SYSOUT=A
//SYSDUMP  DD  SYSOUT=A
//SYSUT1   DD  DSN=HERC01.MYMACLIB,DISP=OLD
//SYSUT2   DD  DSN=HERC01.MYMACLIB,DISP=OLD
//SYSIN    DD  DATA
./  ADD NAME=JSR,LIST=ALL
         MACRO                                                          00001800
         JSR   &SUB                                                     00001900
         LA    11,*+16        RETURN ADDRESS                            00002000
         ST    11,0(,3)       SAVE ON STACK                             00002100
         LA    3,4(,3)        ADJUST SP AFTER PUSH                      00002200
         B     &SUB           JUMP TO SUBROUTINE                        00002300
         MEND                                                           00002400
./ ENDUP                                                                00002500
/*
//*
//* ADD RETURN FROM SUBROUTINE MACRO
//*
//RTSMAC   EXEC PGM=IEBUPDTE
//SYSPRINT DD  SYSOUT=A
//SYSDUMP  DD  SYSOUT=A
//SYSUT1   DD  DSN=HERC01.MYMACLIB,DISP=OLD
//SYSUT2   DD  DSN=HERC01.MYMACLIB,DISP=OLD
//SYSIN    DD  DATA
./  ADD NAME=RTS,LIST=ALL
         MACRO                                                          00002600
         RTS                                                            00002700
         S     3,=F'4'       ADJUST STACK POINTER                       00002800
         L     11,0(,3)      GET RETURN ADDRESS                         00002900
         BR    11            RETURN TO CALLER                           00003000
         MEND                                                           00003100
./ ENDUP                                                                00003200
/*
