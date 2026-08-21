.intel_syntax noprefix
.global atoi_digit

atoi_digit:
xor rax, rax
mov al, byte ptr [rdi]
sub al, 0x30
ret
