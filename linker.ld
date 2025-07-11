ENTRY(_Reset) /* start at _Reset which is defined in boot.s */
SECTIONS
{
 . = 0x10000; /* . represents the current location counter, we will start at 0x10000 */
 .boot . : { boot.o(.text) } /* special boot section for boot.s */
 .text : { *(.text) } /* text section contains code */
 .data : { *(.data) } /* data section contains initialized data such as hard coded var values */
 .bss : { *(.bss COMMON) } /* bss section contains uninitialized data, such as global variables */
 . = ALIGN(8);
 . = . + 0x1000; /* 4kB of stack memory */
 stack_top = .; /* define the top of the stack, so that boot.s can use it */
}