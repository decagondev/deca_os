; string printing function
PrintString:
    ; save the reg values to change stack frame
	push ax
	push bx

    ; set the write char bios function
	mov ah, 0x0e
    ; start a loop over putting a char to screen
	.PutChar:
	cmp [bx], byte 0 ; break out of loop if we hit a null terminator
	je .End
		mov al, [bx] ; ise bx as a counter / mem ref
		int 0x10 ; call the bios call to write
		inc bx ; increment the ref to next memory address
		jmp .PutChar ; loop
	.End: ; end of loop label

    ; set back the registers to move back to the old stack frame
	pop ax
	pop bx

	ret ; return to caller