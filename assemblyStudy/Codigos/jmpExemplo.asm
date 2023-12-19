section .text
global _start

_start:

mov eax, 1 ;Mova o valor 1 para o registrador eax
mov ebx, 1 ;Mova o valor 5 para o registrador ebx

cmp eax, ebx ;Compare os valores dos registradores eax e ebx
je label1    ;Se forem iguais, pule para label1
jmp label2   ;Se forem diferentes, pule para label2

label1:
mov edx, len ;Mova o valor de len para o registrador edx
mov ecx, msg ;Mova o valor de msg para o registrador ecx
mov ebx, 1   ;Mova o valor 1 para o registrador ebx
mov eax, 4   ;Mova o valor 4 para o registrador eax
int 0x80     ;Interrupção do sistema
jmp fim      ;Pule para o fim

label2:
mov edx, len ;Mova o valor de len para o registrador edx
mov ecx, msg ;Mova o valor de msg para o registrador ecx
mov ebx, 1   ;Mova o valor 1 para o registrador ebx
mov eax, 4   ;Mova o valor 4 para o registrador eax
int 0x80 ;Interrupção do sistema

fim: ;Fim do programa
mov eax, 1 ;Mova o valor 1 para o registrador eax
mov ebx, 0 ;Mova o valor 0 para o registrador ebx
int 0x80 ;Interrupção do sistema


section .data

msg db "É igual", 0x0a ;Mensagem a ser exibida
len equ $ - msg ;Tamanho da mensagem
msg2 db "É diferente", 0x0a ;Mensagem a ser exibida
len2 equ $ - msg2 ;Tamanho da mensagem
int 0x80 ;Interrupção do sistema 




