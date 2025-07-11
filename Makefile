CROSS_PREFIX=arm-none-eabi-
BUILT_OS_NAME=worthl_os

all: $(BUILT_OS_NAME).bin

%.o: %.c %.s
	$(CROSS_PREFIX)gcc -c -mcpu=arm926ej-s -g $< -o $@

$(BUILT_OS_NAME).elf: kernel.o boot.o
	$(CROSS_PREFIX)ld -T linker.ld $^ -o $@

$(BUILT_OS_NAME).bin: $(BUILT_OS_NAME).elf
	$(CROSS_PREFIX)objcopy -O binary $< $@

run: $(BUILT_OS_NAME).bin
	qemu-system-arm -M versatilepb -m 128M -nographic -kernel $<

clean:
	rm -f *.bin *.elf *.o *.iso