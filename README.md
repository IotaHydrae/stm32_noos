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
It used  by arm-none-eabi-ld.

`startup_stm32f103zetx.s` - the init asm program

this program used to 


## Keil

* `keil` - structre of keil build



## More
