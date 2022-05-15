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
.global _start
.global delay

_start:
	bl SystemInit
	bl main
	bx lr

delay:
        sub r0, r0, #1
        cmp r0, #0
        bne delay
        mov pc, lr

