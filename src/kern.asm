[org 0x7e00]


; mov bx, KernLoadOKStr
; call PrintMsg
jmp StartProtectedMode
; jmp $ ; infinite loop in kernel
%include 'src/loading_msg.asm'

KernLoadOKStr:
    db 'Loaded DecaOS Kernel', 0x0a, 0x0d, 0

StartProtectedMode:
    cli ; clear interupts (dissable the interupts)

    ; load the A20 line for backward compatibility
    call EnableA20Line


    jmp $ ; infinite loop on faliure

EnableA20Line:
    in al, 0x02 ; this is an in port function to write to hardware
    or al, 2 ; bitwise or od the low portion of the ax register against 2
    out 0x92, al ; out port operation data is in al and the port is 0x92
    ret ; return to caller

times 2048-($-$$) db 0