ORG 2000H 		; Assembly Starts from 2000H

; Main Program
START:	MOV P1, #0XFF	; Move 11111111 to PORT1.
	CALL WAIT 	; Call WAIT 
	MOV A, P1 	; Move P1 value to ACC 
	CPL A 		; Complement ACC
	MOV P1, A 	; Move ACC value to P1
	CALL WAIT 	; Call WAIT
	SJMP START 	; Jump to START
		
WAIT:
			; Wait loop, time: 50 ms. Clock: 11059.2 kHz (12 / MC). Used registers: R0, R1, R2
	MOV	R2, #002h
	MOV	R1, #0C6h
	MOV	R0, #034h
	NOP
	DJNZ	R0, $
	DJNZ	R1, $-5
	DJNZ	R2, $-9
	MOV	R1, #007h
	MOV	R0, #0EAh
	NOP
	DJNZ	R0, $
	DJNZ	R1, $-5
	RET 		; Return to Main Program

END  			; End Assembly
