# Copyright (c) 2022 IotaHydrae
# 
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

PREFIX?=arm-none-eabi-
CC:=$(PREFIX)gcc
LD:=$(PREFIX)ld
AR:=$(PREFIX)ar
OBJCOPY:=$(PREFIX)objcopy
OBJDUMP:=$(PREFIX)objdump
SIZE:=$(PREFIX)size

LIBSPEC:=-L/usr/lib/arm-none-eabi/newlib/

FLAGS:=-mcpu=cortex-m3 -mfloat-abi=soft -mthumb -g

LINK_SCRIPT:=STM32F103ZETX_FLASH.ld

OBJS:= startup_stm32f103zetx.o \
	head.o

default:led.bin

led.bin: clean $(OBJS)
	$(LD) $(OBJS) $(LIBSPEC) -T $(LINK_SCRIPT) -lc -lm -o led.elf

	$(OBJCOPY) -O binary -S led.elf led.bin
	$(OBJDUMP) -D -m arm led.elf > led.dis
	$(SIZE) led.elf

%.o:%.S
	$(CC) -c $(FLAGS) $< -o $@
%.o:%.s
	$(CC) -c $(FLAGS) $< -o $@
%.o:%.c
	$(CC) -c $(FLAGS) $< -o $@

.PHONY:clean
clean:
	rm -rf *.img *.dis *.elf *.o *.bin

.PHONY:write
write:led.bin
	st-flash --connect-under-reset write $< 0x08000000

