//TSOMSG  JOB REGION=1024K,CLASS=A,MSGCLASS=Z                           00000134
//*                                                                     00000231
//* DELETE TSOMSG MEMBER                                                00000331
//*                                                                     00000431
//DELSTP  EXEC PGM=IDCAMS                                               00000533
//SYSPRINT DD  SYSOUT=*                                                 00000631
//SYSIN    DD  *                                                        00000731
  DELETE HERC01.PRGLIB.LOAD(TSOMSG)                                     00000831
/*                                                                      00000931
//*                                                                     00001031
//ASM     EXEC ASMFCL,                                                  00001129
// MAC1='SYS1.AMODGEN',MAC2='HERC01.MYMACLIB'                           00001224
//ASM.SYSIN DD  DSN=HERC01.GITCODE.ASM(TSOMSG),DISP=OLD                 00001312
//LKED.SYSLMOD DD  DSN=HERC01.PRGLIB.LOAD(TSOMSG),DISP=MOD              00001430
