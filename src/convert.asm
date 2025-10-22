; covert.asm
section .text
  global convert_int_to_str

convert_int_to_str:
  dec rsi

  .convert_loop:
    xor rdx, rdx
    mov rbx, 10
    div rbx
    add dl, '0'
    mov [rsi], dl
    dec rsi
    test rax, rax
    jnz .convert_loop

    ret
