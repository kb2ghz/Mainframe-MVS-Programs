           PRINT    NOGEN
           REGISTER             * REGISTER DEFINES FROM MYMACLIB
TSOSEG     CSECT
           SAVE     (14,12)
           BASR     R12,R0      * ESTABLISH BASE REGISTER
           USING    *,R12
           ST       R13,SAVE+4
*
           LR       2,1         * SAVE ADDRESS OF THE CPPL
           USING    CPPL,2
           L        3,CPPLCBUF  * GET ADDRESS OF THE COMMAND BUFFER
           LA       3,2(,3)     * SKIP 1/2 WORD
*
           TPUT     MSG1,L'MSG1
*
           TPUT     (3),80     * ECHO COMMAND ARGUMENT
*
           L        R13,SAVE+4
           RETURN   (14,12),RC=0
*
SAVE       DS       18F
*
MSG1       DC       CL80'ECHO COMMAND ARGUMENT(S): '
*
           LTORG
           IKJCPPL              * CPPL DSECT
           END
