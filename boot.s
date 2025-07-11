.global _Reset
_Reset:
 LDR x29, =stack_top
 MOV sp, x29
 BL c_entry
 B .
