%include "syscall.mac"

	SECTION .text
	global _start
	EXTERN printhex
_start:
    	mov rdx, [B+8*0]
	clc
	mov r11, [R+8*0]
	mulx r11, rax, [A+8*0]
	mov [R+8*0], r11
	mov [C+8*0], rax

	stepone 1, 0
	stepone 2, 1
	stepone 3, 2
	stepone 4, 3
	stepone 5, 4
	stepone 6, 5
	stepone 7, 6
	mov r11, 0
	adc [R+8*7], r11

	%assign i 1
	%rep 7
	starttwo i
	two 0,1,2
	two 1,2,3
	two 2,3,4
	two 3,4,5
	two 4,5,6
	two 5,6,7
	mov r10,[R+8*6]
	mulx r8, r10, [A+8*7]
	mov [R+8*6], r10
	mov r10, [R+8*6]
	mov r11, [R+8*7]
	adox r10, r11
	mov [R+8*6], r10
	mov [R+8*7], r11
	mov [R+8*8], r10
	adcx r10, rax
	mov [R+8*8], r10
	mov [R+8*7], r8
	mov r10, [R+8*7]
	adox r10, rax
	mov [R+8*7], r10
	%assign i i+1
	%endrep

	%assign i 0
	%rep 8
	mov r9, [R+i*8]
	mov [(C+64)+i*8], r9
	%assign i i+1
	%endrep

    print A, 64
	print B, 64
	print C, 128
    	EXIT
;==================================================
	SECTION .data
A dq 0x3ddf156de99ae2c6, 0x23ae151d238bcbed, 0x39658ba003e9ef01, 0xa3d6be921e0b70e2, 0xb62cf6085d5d1b66, 0x04b93fbf6abb8c90, 0xd8d4d00152b432f4, 0x487610c816f7e4a8
B dq 0x1d64dcfce6d71588, 0x76900d93551a0fc2, 0xa6185295c9f7d4c0, 0xcda6f8c10874a10b, 0xd3d742a533fd3f52, 0x3874539ad509954a, 0x2980bb2055e53193, 0x292c750319a5db9a
C dq 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
RD dq 0x0
R dq 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
