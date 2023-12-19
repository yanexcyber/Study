;Iniciamos um programa em Assembly declarando as diretivas de montagem: 'section .text' e 'global _start'
;o Assembler é o que traduz o codigo Assembly para linguagem de máquina
;Os labels são para facilitar para nós humanos indicarmos para o Assembler onde o programa começa e onde ele termina
    ;e quantos bytes ele ocupa e se move pela memória

;O código de máquina em si é binário, então, o ASSEMBLER é o mais próximo que podemos chegar de escrever código de máquina;

;Procurar na internet pelo livro: Guia Mangá de Microprocessadores


;Um processador possui uma arquitetura de proteção chamada de Rings, que são anéis de proteção. O Ring 0 é o mais privilegiado onde o kernel do S.O roda;

;No ring 0 é possível controlar completamente o hardware, e no ring 3 é onde os programas do usuário roda, e ele não tem acesso ao hardware;

;Por quando criamos um programa em ring 3, ele não tem acesso ao hardware. Ou seja não podendo acessar o ring 0

;A interrupção é a forma de chamar o processador para executar uma função. E a interrupção 80h é a interrupção que chama o kernel do S.O para executar uma função;
            

;Aqui é onde eu inicio o programa. Quando criamos um programa ele executa em nível que é chamado de modo de usuário;

section .text
global _start

_start:
    mov eax, 0x04 ;movendo o valor 4 para o registrador eax
    mov ebx, 0x01 ;movendo o valor 1 para o registrador ebx
    mov ecx, msg  ;movendo o valor da variável msg para o registrador ecx
    mov edx, len  ;movendo o tamanho da variável len para o registrador edx
    int 0x80      ;chamando a interrupção 0x80 para executar a função de escrever na tela, o porque disso é porque o kernel do S.O é quem tem acesso ao hardware.
    

    mov eax, 0x01 ;movendo o valor 1 para o registrador eax para fechar o programa
    mov edx, 0x00 ;movendo o valor 0 para o registrador edx pois não temos nada para passar para o kernel do S.O
    int 0x80      ;chamando a interrupção 0x80 para executar a função de fechar o programa

;Criando uma nova seção para o código de máquina, a seção de dados;

section .data
    msg db 'Hello, World!', 0x0a ;db = define byte, e 0x0a é o código de máquina para pular uma linha
    len equ $ - msg ;equ = equate, e $ é o endereço de memória atual, e o menos msg é para calcular o tamanho da string
                    ;O que o código faz é calcular o tamanho da string menos o tamanho do endereço de memória atual, para saber quantos bytes a string ocupa na memória
                    ;Se movermos uma string para um endereço de memória já utilizado, ele será sobrescrito, então, temos que saber o tamanho da string para não sobrescrevermos a memória.


