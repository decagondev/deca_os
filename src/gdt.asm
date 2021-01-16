
gdt_nulldesc:
	dd 0
	dd 0	
gdt_code_descriptor:
	dw 0xFFFF			; Limit
	dw 0x0000			; Base (low)
	db 0x00				; Base (medium)
	db 10011010b		; Flags
	db 11001111b		; Flags + Upper Limit
	db 0x00				; Base (high)
gdt_data_descriptor:
	dw 0xFFFF
	dw 0x0000
	db 0x00
	db 10010010b
	db 11001111b
	db 0x00

gdt_end:

gdt_descriptor:
	gdt_size: 
		dw gdt_end - gdt_nulldesc - 1
		dq gdt_nulldesc

code_segment equ gdt_code_descriptor - gdt_nulldesc
dataseg equ gdt_data_descriptor - gdt_nulldesc
[bits 32]

EditGDT:
	mov [gdt_code_descriptor + 6], byte 10101111b

	mov [gdt_data_descriptor + 6], byte 10101111b
	ret

[bits 16]