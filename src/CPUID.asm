; check for CPUID
DetectCPUID:
    pushfd ; push the flags register on to the stack
    
    pop eax ; pop current eax
    mov ecx, eax ; store eax in to ecx for comparitor

    xor eax, 1 << 21 ; flip a bit in eax

    push eax ; push current eax value to the stack

    popfd ; pop the flag values off the stack

    pushfd ; push the flag values again

    pop eax ; pop current val on to eax
    push ecx ; push ecx val on to the stack

    popfd ; pop stack to flags

    xor eax, ecx ; xor the 2 values. if they are same it will result in a zero

    jz NoCPUID ; if it is zero then the flipping did not work so there is no CPUID
    ret ; return to caller


; check for long mode

DetectLongMode:
mov eax, 0x80000001 ; put val in to eax
cpuid ; run cpuid
test edx, 1 << 29 ; compare to see if edx and 1 << 29 are the same
jz NoLongMode ; if we return a zero then go to the NoLongMode code
ret ; return to caller


NoLongMode:
	hlt ; No Long Mode Support so halt

NoCPUID:

	hlt ; No CPUID support so halt