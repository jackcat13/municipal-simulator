format ELF64

section '.text' executable
public main
public _start
extrn BeginDrawing
extrn ClearBackground
extrn CloseWindow
extrn EndDrawing
extrn _exit
extrn InitWindow
extrn WindowShouldClose

main:
_start:
    mov rdi, 800
    mov rsi, 600
    mov rdx, title
    call InitWindow

    .not_closed_window:
        call WindowShouldClose
        test rax, rax
        jnz .closed_window

        call BeginDrawing
        mov rdi, 0xFF181818
        call ClearBackground
        call EndDrawing
        
        jmp .not_closed_window
    
    .closed_window:
        call CloseWindow
        mov rdi, 0
        call _exit

section '.data' writeable
title: db "Municipal simulator", 0

section '.note.GNU-stack'
