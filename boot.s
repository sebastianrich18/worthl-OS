.global _Reset # Declare the _Reset label as global so the linker can see it and set it as the entry point
_Reset:
 LDR sp, =stack_top # Set stack pointer to top of stack as defined in linker.ld
 BL c_entry # Branch (jump) to C code
 B . # Branch to . (infinite loop)
