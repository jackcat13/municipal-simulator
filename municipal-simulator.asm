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
    sub rsp, 40
    mov ecx, 800
    mov edx, 600
    mov r8, title
    call InitWindow

    .not_closed_window:
        call WindowShouldClose
        test rax, rax
        jnz .closed_window

        call BeginDrawing
        mov ecx, 0xFF181818
        call ClearBackground
        call EndDrawing
        
        jmp .not_closed_window
    
    .closed_window:
        call CloseWindow
        mov ecx, 0
        call _exit

section '.data' writeable
title: db "Municipal simulator", 0

section '.note.GNU-stack'
