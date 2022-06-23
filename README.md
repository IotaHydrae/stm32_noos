# STM32 noos
No-os program for ST STM32 build by gcc

## Platfrom

- a dev board base on STM32F103ZET6

- a st-link debugger

- a miniUSB datalink

## Gcc

The gcc dir contains examples build by gcc, and keil so on.


* `gcc` - structre of gcc build

`STM32F103ZETX_FLASH.ld` - the gccc link script

This script identifys where .data .rodata and other sections etc stores on,
defines stack and heap, It's used  by arm-none-eabi-ld.

`startup_stm32f103zetx.s` - the init asm program

this program used to do these works:
- Set the initial SP
- Set the initial PC == Reset_Handler,
- Set the vector table entries with the exceptions ISR address
- Configure the clock system   
- Configure external SRAM mounted on STM3210E-EVAL board
  to be used as data memory (optional, to be enabled by user)
- Branches to main in the C library (which eventually
  calls main()).

* `keil` - structre of keil build

(TODO)

## More
