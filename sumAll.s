.intel_syntax noprefix
.global _start
.extern atoi
.extern itoa

_start:
mov rcx, 2
mov rsi, [rsp]
mov rdx, 0
inc rsi # so we can compare greater than
loop:
cmp rcx, rsi
je next
mov rdi, [rsp+rcx*8] # now rax has pointer to the string in argv

#pushing to stack to preserve caller saved reg value
push rcx
push rsi
push rdx

call atoi
pop rdx
pop rsi
pop rcx
add rdx, rax

inc rcx
jmp loop

next:
mov rdi, rdx
add rsp, 32
mov rsi, rsp
call itoa # now rsi has the string and rax know the count of the string

#write syscall
mov rdx, rax
mov rdi, 1
mov rax, 1
syscall

#exit syscall
mov rax, 60
mov rdi, 42
syscall