// Copyright (c) 2022 IotaHydrae
// 
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT
//
// This program is used to blink the led that
// connected on the PB5

.equ	FLASH_BASE	,0x08000000	@ on chip flash, blank 1k
.equ	RCC_BASE	,0x40021000	@ RCC base
.equ	RCC_APB2ENR	,0x18		@ apb2 enable

.equ	GPIOB_BASE	,0x40010C00
.equ	GPIOx_CRL	,0x00		@ conf low
.equ	GPIOx_CRH	,0x04		@ conf high
.equ	GPIOx_IDR	,0x08		@ input data
.equ	GPIOx_ODR	,0x0c		@ output data
.equ	GPIOx_BSRR	,0x10		@ bit set/reset
.equ	GPIOx_BRR	,0x14		@ bit reset

.text
.global _main

_main:
	@ enable gpio clock
	ldr r0, =(RCC_BASE + RCC_APB2ENR)
	ldr r1, [r0]

	ldr r2, =#0x08
	orr r1, r2

	str r1, [r0]

	@ set gpio to output,push-pull, 2MHz
	ldr r0, =(GPIOB_BASE + GPIOx_CRL)
	ldr r1, [r0]

	ldr r2, =#0x00100000
	orr r1, r2

	str r1, [r0]

	@ ldr bsrr reg val to r1
	ldr r0, =(GPIOB_BASE + GPIOx_BSRR)
	ldr r1, [r0]

loop:
	@ set gpio to low
	ldr r2, =#0x00200000
	orr r1, r2
	str r1, [r0]

	@ make a delay
	ldr r2, =#0x00000f00
	bl delay

	@ set gpio to high
	ldr r2, =#0x00000020
	orr r1, r2
	str r1, [r0]

	@ make a delay
	ldr r2, =#0x00000f00
	bl delay

	b loop

delay:
	sub r2, r2, #1
	cmp r2, #0
	bne delay
	mov pc, lr
