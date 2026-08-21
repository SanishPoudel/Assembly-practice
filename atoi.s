.intel_syntax noprefix
.global atoi_digit
.global atoi

atoi_digit:
xor rax, rax
mov al, byte ptr [rdi]
sub al, 0x30
ret

atoi:
mov rcx, rdi 
xor rdi, rdi 
mov rsi, 0 
mov r9, 0
mov r10, 1

loop: 
mov r8b, byte ptr [rcx+rsi] 

cmp r8b, 0x2d
je flag 

cmp r8b, 0 
je done 

lea rdi, [rcx+rsi] 
call atoi_digit 
imul r9, 10 
add r9, rax 
inc rsi 
jmp loop

flag:
mov r10, -1
inc rsi
jmp loop

done:
mov rax, r9
imul rax, r10
ret
