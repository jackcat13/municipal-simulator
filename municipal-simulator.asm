format ELF64

section '.text' executable
public _start
extern InitWindow

_start:
    mov rdi, 800
    mob rsi, 600
    mov rdx, title
    call InitWindow


section '.data' writeable
title: db "Municipal simulator", 0
section '.note.GNU-stack'