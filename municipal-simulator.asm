format ELF64

section '.text' executable
public _start
extrn InitWindow

_start:
    mov rdi, 800
    mov rsi, 600
    mov rdx, title
    call InitWindow
    
_loop:
    jmp _loop


section '.data' writeable
title: db "Municipal simulator", 0
section '.note.GNU-stack'