; print Loading DecaOS... to the screen (using function select)
; the value we load in to ah will be the specific function
; in our case it is the write char function 0x0e
; the value we pass to al will be the char we want to write
; and 0x10 is the call to the write biso subroutine / interrupt

; L
mov ah, 0x0e ; move write interrupt to high area of ax
mov al, 'L' ; move a char to the low area of ax
int 0x10 ; call the interrupt to write it out from bios call

; o
mov ah, 0x0e ; move write interrupt to high area of ax
mov al, 'o' ; move a char to the low area of ax
int 0x10 ; call the interrupt to write it out from bios call

; a
mov ah, 0x0e ; move write interrupt to high area of ax
mov al, 'a' ; move a char to the low area of ax
int 0x10 ; call the interrupt to write it out from bios call

; d
mov ah, 0x0e ; move write interrupt to high area of ax
mov al, 'd' ; move a char to the low area of ax
int 0x10 ; call the interrupt to write it out from bios call

; i
mov ah, 0x0e ; move write interrupt to high area of ax
mov al, 'i' ; move a char to the low area of ax
int 0x10 ; call the interrupt to write it out from bios call

; n
mov ah, 0x0e ; move write interrupt to high area of ax
mov al, 'n' ; move a char to the low area of ax
int 0x10 ; call the interrupt to write it out from bios call

; g
mov ah, 0x0e ; move write interrupt to high area of ax
mov al, 'g' ; move a char to the low area of ax
int 0x10 ; call the interrupt to write it out from bios call

; <space>
mov ah, 0x0e ; move write interrupt to high area of ax
mov al, ' ' ; move a char to the low area of ax
int 0x10 ; call the interrupt to write it out from bios call

; D
mov ah, 0x0e ; move write interrupt to high area of ax
mov al, 'D' ; move a char to the low area of ax
int 0x10 ; call the interrupt to write it out from bios call

; e
mov ah, 0x0e ; move write interrupt to high area of ax
mov al, 'e' ; move a char to the low area of ax
int 0x10 ; call the interrupt to write it out from bios call

; c
mov ah, 0x0e ; move write interrupt to high area of ax
mov al, 'c' ; move a char to the low area of ax
int 0x10 ; call the interrupt to write it out from bios call

; a
mov ah, 0x0e ; move write interrupt to high area of ax
mov al, 'a' ; move a char to the low area of ax
int 0x10 ; call the interrupt to write it out from bios call

; O
mov ah, 0x0e ; move write interrupt to high area of ax
mov al, 'O' ; move a char to the low area of ax
int 0x10 ; call the interrupt to write it out from bios call

; S
mov ah, 0x0e ; move write interrupt to high area of ax
mov al, 'S' ; move a char to the low area of ax
int 0x10 ; call the interrupt to write it out from bios call

; .
mov ah, 0x0e ; move write interrupt to high area of ax
mov al, '.' ; move a char to the low area of ax
int 0x10 ; call the interrupt to write it out from bios call

; .
mov ah, 0x0e ; move write interrupt to high area of ax
mov al, '.' ; move a char to the low area of ax
int 0x10 ; call the interrupt to write it out from bios call

; .
mov ah, 0x0e ; move write interrupt to high area of ax
mov al, '.' ; move a char to the low area of ax
int 0x10 ; call the interrupt to write it out from bios call


; 2 writes to do a carage return

; move the cursor down
mov ah, 0x0e ; move write interrupt to high area of ax
mov al, $0A ; move a char to the low area of ax
int 0x10 ; call the interrupt to write it out from bios call

; move the cursor to the start of the line
mov ah, 0x0e ; move write interrupt to high area of ax
mov al, $0D ; move a char to the low area of ax
int 0x10 ; call the interrupt to write it out from bios call


jmp $ ; infinite loop

times 510-($-$$) db 0 ; padding for the bootloader

dw 0xaa55 ; bootable signature