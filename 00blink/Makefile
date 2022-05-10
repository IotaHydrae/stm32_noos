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

FLAGS:=-c -mthumb -mcpu=cortex-m3 -g

LINK_SCRIPT:=stm32_flash.ld

objs:=startup_stm32f10x_hd.o head.o

default:led.bin

led.bin: clean $(objs)
	$(LD) -T $(LINK_SCRIPT) -g $(objs) -o led.elf

	$(OBJCOPY) -O binary -S led.elf led.bin
	$(OBJDUMP) -D -m arm led.elf > led.dis

%.o:%.S
	$(CC) $(FLAGS) -o $@ $<
%.o:%.s
	$(CC) $(FLAGS) -o $@ $<
%.o:%.c
	$(CC) $(FLAGS) -o $@ $<

.PHONY:clean
clean:
	rm -rf *.img *.dis *.elf *.o *.bin

.PHONY:write
write:led.bin
	st-flash --reset write $< 0x08000000

