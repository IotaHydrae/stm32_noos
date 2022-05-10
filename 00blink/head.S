.equ	FLASH_BASE	,0x80000000
.equ	RCC_BASE	,0x04001000
.equ	RCC_APB2ENR	,0x18

.text
.global _start

_start:
	@ enable gpio
	ldr r0, = (RCC_BASE + RCC_APB2ENR)

	@ set gpio to output

loop:
	@ set gpio to low

	@ make a delay

	@ set gpio to high

	@ make a delay

	b loop

delay:
	sub r0, r0, #1
	cmp r0, #0
	bne delay
	mov pc, lr
