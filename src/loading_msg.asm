; function label for printing a string to the screen
PrintMsg:
    mov ah, 0x0e ; set function to print char
    .PrintChar: ; set up a starting loop label
    cmp [bx], byte 0 ; compare the number at bx with the byte representation of zero 
    je .End ; if the compare is true then we can jump to the exit label else we will continue with the body of the loop 
        mov al, [bx] ; load in the data from the address pointed to by bx
        int 0x10 ; call the write interupt
        inc bx ; increment the value of the address at bx
        jmp .PrintChar
    .End:
    ret ; return from the function

MessageText:
    db 'Loading DecaOS...', 0x0a, 0x0d, 0
