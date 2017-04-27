TITLE Store integer into an array

; Description:
;	TASK1: read a non-negative integer n
;	TASK2: store the integer from 0,1,up to n to an array
; 
; Revision date: 20170326

INCLUDE Irvine32.inc
INCLUDE macros.inc

.data
arr		DWORD	1000 DUP(?)
n		DWORD	?

.code
main PROC
; get the input n
	call ReadDec
	mov n, eax

;store 0, 1, 2, ..., n to the array
	mov eax, 0
	mov ebx, 0
	mov ecx, n
	inc ecx
  L1:
	mov [arr+ebx], eax
	inc eax
	add ebx,4
	loop L1

;show the array elements on the screen
	call Crlf
	call ShowArray

	call WaitMsg
	exit
main ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ShowArray PROC
; show the array elements on the screen
	mov ebx, 0
	mov ecx, n
	inc ecx
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