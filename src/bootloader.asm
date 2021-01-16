[org 0x7c00] ; set an origin

mov [BOOT_DISK], dl ; set up the boot disk id

; set up the stack
mov bp, 0x7c00 ; move the base pointer to the origin address
mov sp, bp 

; read data from the second sector onward
call ReadDisk

; move the flow to the program space
jmp PROG_SPACE

; include the printing functions and loading functions
%include 'src/boot_print.asm'
%include 'src/disk_loader.asm'

; pad out the sector
times 510-($-$$) db 0

; bootable signature
dw 0xaa55