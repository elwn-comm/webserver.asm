section .text
    global log

log:
    call log_error
    ret

log_error:
    mov rax, 1
    mov rdi, 1
    mov rsi, hello
    mov rdx, helloLen
    syscall
    ret

section .data
    hello db "Hello World", 0xa
    helloLen equ $-hello
