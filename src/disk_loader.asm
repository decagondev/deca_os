
PROG_SPACE equ 0x8000 ; set a constand ref to program space

; read disk function
ReadDisk:

	mov ah, 0x02 ; set the bios function for disk read
	mov bx, PROG_SPACE ; set the base to start at program space
	mov al, 32 ; read 32 sectors
	mov dl, [BOOT_DISK] ; set which disk to read from
	mov ch, 0x00
	mov dh, 0x00
	mov cl, 0x02

	int 0x13 ; call the bios routine

	jc DiskReadFailed ; if this fails jump to a faliur message

	ret ; return to caller

BOOT_DISK:
	db 0 ; uninitialized data

DiskReadErrorString:
	db 'Disk Read Failed',0

DiskReadFailed:
	mov bx, DiskReadErrorString
	call PrintString

	jmp $ ; infinite loop on faliure
