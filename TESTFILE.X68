*-----------------------------------------------------------
* Title      :  I/O
* Written by :  Sesario Imanputra, Zachary Liong, Micha Rice, Marci Ma
* Date       :  
* Description: Starts at 4000. For testing purposes, theres a bunch of ML codes to disassemble at 4000. Currently, the first ML code at 4000 is NOP.
* afterwards, it will include ML of whatever we wrote after NOP.
* current I/O should be able to detext values exceeding the 32 bit unsigned range (FFFFFFFF) and recognize invalid input.
* if you input a lower case letter, it will automatically convert into uppercase. 
*-----------------------------------------------------------    
        ORG    $4000   
****************************************************                    
START:
pro              
                NOP
                
                 ;OPCODEGROUP8 TEST
                 MOVE.B  D2,D3      
                 ;MOVEA #$00000047,A0 ;should be data
                 
                 ;OPCODEGROUP1.1 TEST 
                 MOVEM.W D0,-(A5)
                 MOVEM.W D1,-(A5)
                 MOVEM.W D2,-(A5) 
                 MOVEM.W D7,-(A5)
                 
                 MOVEM.W A0,-(A5) 
                 MOVEM.W A1,-(A5) 
                 MOVEM.W A2,-(A5) 
                 MOVEM.W A7,-(A5)
                 MOVEM.W D0-D7/A0-A7,-(A5)    
                 MOVEM.W D1-D4/A2-A5,-(A5) 

                 MOVEM.W (A5)+,D0
                 MOVEM.W (A5)+,D1
                 MOVEM.W (A5)+,D2
                 MOVEM.W (A5)+,D7
                 MOVEM.W (A5)+,A0
                 MOVEM.W (A5)+,A1 
                 MOVEM.W (A5)+,A2
                 MOVEM.W (A5)+,A7  
                 MOVEM.W (A5)+,D0-D7/A0-A7 ;D7 not printing
                 MOVEM.W (A5)+,D1-D4/A2-A5

                 
                 ;JMP    pa      ;should be data (not wokring)
                 
                 ;OPCODEGROUP6 TEST
                 ADD.B   D2,D3 
                 ADD.B   D0,$00001012
                 ;ADDX   -(A2),-(A3)    ;should be data (not working)
                 ;ADDA   D3,A3          ;should be data
                 
                 ;OPCODEGROUP4 TEST
                 SUB.B    D2,D3 
                 SUB.B   D0,$00001012
                 ;SUBX   -(A2),-(A3)    ;should be data (not working)
                 ;SUBA   D3,A3          ;should be data
                 
                 ;OPCODEGROUP5 TEST
                 MULS  D2,D3 
                 ;MULU  D2,D3           ;should be data (not working)
                 
                 ;OPCODEGROUP3 TEST
                 DIVU  D2,D3 
                 ;DIVS  D2,D3           ;should be data
                 
                 ;OPCODEGROUP1.5 TEST
                 LEA   $2000,A2  
                 
                 ;OPCODEGROUP5 TEST
                 AND.B   #3,D3 
                 AND.B   D0,$00001012           
                 ;EXG   D2,D3           ;should be data (not working)
                 
                 ;OPCODEGROUP1.3 TEST
                 NOT.B   D3
                 NOT.W   (A3)+
                 NOT.L   -(A3)
                 NOT.W   $1234
                 NOT.L   $12345678
                 ;MOVE  D3,SR           ;should be data (not working)

                 
                 ;OPCODEGROUP7.1.1 TEST  REG SHIFT
                 ;LSL.B   #2,D3 
                 LSL.L   D0,D5 
                 
                 ;OPCODEGROUP7.1.2 TEST   REG SHIFT
                 ASL.B   #2,D3 
                 
                 ;OPCODEGROUP7.3.2 TEST     MEM SHIFT
                 LSL   (A0)+ 
                
                 ;OPCODEGROUP7.3.1 TEST       MEM SHIFT           
                 ASL   (A0)+ 
                 
                ;OPCODEGROUP2.3 TEST
                 BGT   pa
                
pa              ;OPCODEGROUP2.4 TEST
                 BLE   pi
                
pi              ;OPCODEGROUP2.2 TEST
                 BEQ   pu
                
pu              ;OPCODEGROUP2.1 TEST
                 BRA.W    po 
     
po
                 RTS

pe               ;OPCODEGROUP1.4 TEST
                 JSR   (A1)
                 
                  MOVEA.W #$9100, A0 *A0<-- FFFF9100
                  MOVEA.W #$1000, A1
                  LEA     $9100, A0  *A0<-- 00009100
 	              MOVEA.W #$4213, A0 *A0<-- 00004213
	              MOVEA.L #$9100, A0 *A0<--- 00009100
	              MOVEA.L #$00004213, A0 *A0<-- 00004213
	              MOVE.L #$00008000, D0   
	              MOVEA.W D0, A0
                         
                    SIMHALT             ; halt simulator
    
* Put variables and constants here

    END    START        ; last line of source





                













*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
