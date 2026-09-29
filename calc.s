.intel_syntax noprefix
.global _start
.extern atoi
.extern itoa

_start:
mov rdi, [rsp+16]
call atoi
mov rdi, [rsp+32]
push rax
call atoi
pop rdi

#now rax and rdi have the 2 numbers
mov rsi, [rsp+24]

#check for +
cmp byte ptr [rsi], 0x2b
je add

#check for -
cmp byte ptr [rsi], 0x2d
je sub

# if operator isn't supported
failure:
mov rax, 60
mov rdi, 1
syscall

add:
add rdi, rax
jmp end

sub:
sub rdi, rax
jmp end

end:
add rsp, 0x80
mov rsi, rsp

#now rdi has the value and rsi has the buffer
call itoa

#write to stdout
mov rdx, rax
mov rdi, 1
mov rax, 1
syscall

#exit successfully
mov rax, 60
mov rdi, 0
syscall

