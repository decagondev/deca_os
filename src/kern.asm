[org 0x8000] ; set the origin

jmp EnterProtectedMode ; start going in to protected mode

%include 'src/gdt.asm'
%include 'src/boot_print.asm'


EnterProtectedMode:
	call EnableA20 ; enable the a20 gate
	cli ; clear interupts
	lgdt [gdt_descriptor] ; load the global discriptor table (GDT)
	; change the mode flag
    mov eax, cr0 
	or eax, 1
	mov cr0, eax

    ; do a long jump to the code segment
	jmp code_segment:StartProtectedMode

EnableA20:
	in al, 0x92
	or al, 2
	out 0x92, al
	ret

[bits 32]

StartProtectedMode:

	mov ax, dataseg
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

	mov [0xb8000], byte 'D'
	mov [0xb8002], byte 'e'
	mov [0xb8004], byte 'c'
	mov [0xb8006], byte 'a'
	mov [0xb8008], byte 'O'
	mov [0xb800a], byte 'S'
	mov [0xb800c], byte '.'
	mov [0xb800e], byte '.'
	mov [0xb8010], byte '.'
	mov [0xb8012], byte ' '
	mov [0xb8014], byte ' '
	jmp $

times 2048-($-$$) db 0
