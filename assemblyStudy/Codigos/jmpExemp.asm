section .text ;code section

global _start ;Start global do programa

_start: ;label

mov eax, 1 ;Mova o valor 1 para o registrador eax
mov ebx, 5 ;Mova o valor 5 para o registrador ebx


cmp ebx, eax ;Compare o valor de ebx com eax
je label1    ;Se forem iguais, pule para label1
jmp label2   ;Se não forem iguais, pule para label2


label1: ;label1
mov edx, len ;Mova o tamanho da mensagem para o registrador edx
mov ecx, msg ;Mova a mensagem para o registrador ecx
mov ebx, 1   ;Mova o valor 1 para o registrador ebx
mov eax, 4   ;Mova o valor 4 para o registrador eax
int 0x80     ;Chame o sistema operacional


label2: ;label2
mov edx, len2 ;Mova o tamanho da mensagem para o registrador edx
mov ecx, msg2 ;Mova a mensagem para o registrador ecx
mov ebx, 1    ;Mova o valor 1 para o registrador ebx
mov eax, 4    ;Mova o valor 4 para o registrador eax
int 0x80      ;Chame o sistema operacional
jne fim       ;Pule para o fim


fim:
mov eax, 1 ;Mova o valor 1 para o registrador eax
mov edx, 0x80 ;Mova o valor 0x80 para o registrador edx


section .data ;data section

msg db "ebx é igual a eax", 0xA ;Mensagem a ser exibida
len equ $ - msg ;Tamanho da mensagem
msg2 db "ebx não é igual a eax", 0xA ;Mensagem a ser exibida
len2 equ $ - msg2 ;Tamanho da mensagem