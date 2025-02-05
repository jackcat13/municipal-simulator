format ELF64

section '.text' executable
public main
public _start
public menuScene
extrn BeginDrawing
extrn ClearBackground
extrn CloseWindow
extrn EndDrawing
extrn _exit
extrn InitWindow
extrn WindowShouldClose

main:
_start:
    sub rsp, 40 ; Alignment Windows

    ; Set current scene to menuScene
    mov rax, menuScene
    mov [current_scene], rax

    mov ecx, 800
    mov edx, 600
    mov r8, title
    call InitWindow

    .not_closed_window:
        call WindowShouldClose
        test rax, rax
        jnz .closed_window


        call BeginDrawing
        mov rax, [current_scene]
        sub rsp, 8  ; Align stack to 16 bytes
        call rax
        add rsp, 8
        call EndDrawing
        
        jmp .not_closed_window
    
    .closed_window:
        call CloseWindow
        mov ecx, 0
        call _exit

menuScene:
    mov ecx, 0xFF181818
    call ClearBackground
    ret

section '.data' writeable
title: db "Municipal simulator", 0
current_scene: dq 0 ; Reserve space for function pointer

section '.note.GNU-stack'
