section .data
  time_val dq 0
  buffer db 16 dup(0)

section .text
  global _start
  extern convert_int_to_str
  extern log

_start:
  mov rax, 201
  lea rdi, [rel time_val]
  syscall

  mov rax, [time_val]

  ; int->str
  lea rsi, [rel buffer + 15] ; param 1
  call convert_int_to_str

  ; add newline to buffer
  lea rsi, [rel buffer + 15]
  mov byte [rsi], 10
  dec rsi

  call log

  mov rax, 60
  xor rdi, rdi
  syscall
