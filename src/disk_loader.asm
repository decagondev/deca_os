PROG_SPACE equ 0x7e00 ; 512 bytes after the boot loader

ReadDisk:
    mov ah, 0x02 ; set the function to read disk
    mov bx, PROG_SPACE ; load in the pointer to the entry point of this .text
    mov al, 4 ; define how many sectors to read 4 sectors
    mov dl, [BOOT_DISK]
    mov ch, 0x00 ; heads and cylinders
    mov dh, 0x00
    mov cl, 0x02 ; start reading at the second sector (the sector after the boot loader)

    int 0x13 ; read disk interupt

    ; lets check for read errors
    jc DiskReadFailed ; if the carry flag is set then jump to the faliur notice

    ; if it does not fail print an ok message
    jmp DiskReadOK
    ret

BOOT_DISK:
    db 0 ; uninitialized data

DiskReadErrorStr:
    db 'Failed to read disk', 0x0a, 0x0d, 0

DiskReadOKStr:
    db 'Disk Load working!', 0x0a, 0x0d, 0

DiskReadFailed:
    mov bx, DiskReadErrorStr
    call PrintMsg
    
    jmp $

DiskReadOK:
    mov bx, DiskReadOKStr
    call PrintMsg
    
    jmp $