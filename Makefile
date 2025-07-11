CROSS_PREFIX=aarch64-elf-
BUILT_OS_NAME=worthl_os

all: $(BUILT_OS_NAME).bin

%.o: %.s
	$(CROSS_PREFIX)gcc -c -mcpu=cortex-a53 -march=armv8-a -g $< -o $@

%.o: %.c
	$(CROSS_PREFIX)gcc -c -mcpu=cortex-a53 -march=armv8-a -g $< -o $@

$(BUILT_OS_NAME).elf: kernel.o boot.o
	$(CROSS_PREFIX)ld -T linker.ld $^ -o $@

$(BUILT_OS_NAME).bin: $(BUILT_OS_NAME).elf
	$(CROSS_PREFIX)objcopy -O binary $< $@

run: $(BUILT_OS_NAME).bin
	qemu-system-aarch64 -M raspi3b -m 1024M -nographic -kernel $<

clean:
	rm -f *.bin *.elf *.o *.iso