TITLE Store factorial into an array(FPU)

; Description:
;	use floatinf-point unit to generate the array
;	TASK1: read a non-negative integer n
;	TASK2: generate an array of
;				1!, 2!, 3!, 4!, ..., n!
; 
; Revision date: 20170326

INCLUDE Irvine32.inc
INCLUDE macros.inc

maxNum = 1000

.data
n		DWORD	?
arr		REAL8	maxNum DUP(?)
preNum	REAL8	1.0
ZERO	REAL8	0.0
ONE		REAL8	1.0

.code
main PROC
; get the input n
	call ReadDec
	mov n, eax

;store 1!, 2!, 3!, 4!, ..., n! to the array
	call generateNumbers

;show the array elements on the screen
	call Crlf
	call ShowArray

	call Crlf
	call WaitMsg
	exit
main ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
generateNumbers PROC
;store 1!, 2!, 3!, 4!, ..., n! to the array
	finit
	mov ecx, n
	mov ebx, 0
	fld ONE
	fld ONE
  L0:
	fmul 
	fst arr[ebx]
	fld preNum
	fld ONE
	fadd
	fst preNum
	add ebx, 8
	loop L0

	ret
generateNumbers ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ShowArray PROC
; show the array elements on the screen
	finit
	mov ecx, n
	mov ebx, 0
  L0:
	fld arr[ebx]
	call WriteFloat
	call Crlf
	fstp arr[ebx]
	add ebx, 8
	loop L0

	ret
ShowArray ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
END main


