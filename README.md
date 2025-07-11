# System Info
ARM 9 (arm926ej-s)
32 bit
Single core

## Boot Process
Defined with `boot.s`, `linker.ld`, and `kernal.c`.
`linker.ld` creates the memory layout, with a 4kb stack
`boot.s` sets up the stack and jumps to `c_entry` in `kernal.c`.
`kernal.c` initializes the UART and prints "Hello World!" to the serial console.