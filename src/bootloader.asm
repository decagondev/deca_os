jmp $ ; infinite loop

times 510-($-$$) db 0 ; padding for the bootloader

dw 0xaa55 ; bootable signature