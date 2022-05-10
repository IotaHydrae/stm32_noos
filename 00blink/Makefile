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


LINK_SCRIPT:=stm32f103ze.lds

objs:=head.o

default:led.bin

led.bin: clean $(objs)
	$(LD) -T $(LINK_SCRIPT) -g $(objs) -o led.elf

	$(OBJCOPY) -O binary -S led.elf led.bin
	$(OBJDUMP) -D -m arm led.elf > led.dis

%.o:%.S
	$(CC) -nostdlib -g -c -o $@ $<
%.o:%.c
	$(CC) -nostdlib -g -c -o $@ $<

.PHONY:clean
clean:
	rm -rf *.img *.dis *.elf *.o *.bin

.PHONY:write-flash
write-flash:led.bin
