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

1. copy the .data section
2. clear the .bss section to zero
3. jump to execute user code
4. set the execption vectors table
etc


* `keil` - structre of keil build

(TODO)

## More
