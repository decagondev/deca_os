[org 0x7e00]

mov bx, KernLoadOKStr
call PrintMsg

jmp $ ; infinite loop in kernel
%include 'src/loading_msg.asm'

KernLoadOKStr:
    db 'Loaded DecaOS Kernel', 0x0a, 0x0d, 0

times 2048-($-$$) db 0