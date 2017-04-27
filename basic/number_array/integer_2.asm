TITLE Store integer into an array_2

; Description:
;	TASK1: read a non-negative integer n
;	TASK2: generate an array of
;				1*2, 2*2, 3*2, 4*2, ....., n*2
; 
; Revision date: 20170326

INCLUDE Irvine32.inc
INCLUDE macros.inc

num = 10	
maxNum = 1000

.data
arr		DWORD	maxNum DUP(?)
n		DWORD	?

.code
main PROC
; get the input n
	call ReadDec
	mov n, eax

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
;store 1, 2, ..., n to the array
	mov eax, 1
	mov ebx, 0
	mov ecx, n
  L1:
	mov edx, eax
	shl edx, 1
	mov [arr+ebx], edx
	inc eax
	add ebx,4
	loop L1
	ret
generateNumbers ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ShowArray PROC
; show the array elements on the screen
	mov ebx, 0
	mov ecx, n
  L2:
	mov eax, [arr+ebx]
	call WriteDec
	call Crlf
	add ebx, 4
	loop L2
	ret
ShowArray ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
END main


