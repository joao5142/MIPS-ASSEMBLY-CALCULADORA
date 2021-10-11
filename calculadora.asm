#CALCULADORA

.data
menu:     .asciiz   "***** MENU *****\n1- Somar\n2-Subtrair\n3-Multiplicar\n4-Dividir\n0-Sair\n"
n1:       .asciiz   "Entre com o primeiro numero:"  
n2:       .asciiz   "Entre com o segundo numero:" 
r:        .asciiz   "Resultado:"
pula:     .asciiz   "\n\n" 


.macro pula_linha #Macro para imprimir a string "pula"
   li $v0,4
   la $a0,pula
   syscall
 
.end_macro

.macro menu 
  li $v0,4
  la $a0,menu
  syscall
  li $v0,5
  syscall
  move $t0,$v0
 
.end_macro

.text 
.globl  main

main:

menu  #CHAMO A MACRO MENU
beq  $t0,1,somar   #Se t0= 1 entao vou pro bloco de codigo somar
beq  $t0,2,subtrair   #Se t0= 2 entao vou pro bloco de codigo subtrair
beq  $t0,3,multiplicar   #Se t0= 3 entao vou pro bloco de codigo multiplicar
beq  $t0,4,dividir   #Se t0= 4 entao vou pro bloco de codigo dividir
beq  $t0,0,sair   #Se t0= 4 entao vou pro bloco de codigo dividir


#BLOCO SOMAR
somar:         
#Le  o numero 1
li $v0,4          #Prepara o processador v0 para imprimir uma string
la $a0,n1          
syscall           #Executa
li $v0,5          #Prepara o processador v0 para  receber um inteiro
syscall
move $t1,$v0

#Le  o numero 2
li $v0,4
la $a0,n2
syscall
li $v0,5        #Prepara o processador v0 para  receber um inteiro
syscall
move $t2,$v0
 
add $t3,$t1,$t2     #soma t1+t2 e coloca o valor em t3

#Mostra o resultado na tela 

li $v0,4
la $a0,r
syscall
li $v0,1
la $a0,($t3)
syscall

#Pula linha e volta para o menu criando um loop
pula_linha
jal main          #VOLTA PRO BLOCO DE CODIGO DO MAIN

#BLOCO SUBTRAIR
subtrair:         
#Le  o numero 1
li $v0,4          #Prepara o processador v0 para imprimir uma string
la $a0,n1          
syscall           #Executa
li $v0,5          #Prepara o processador v0 para  receber um inteiro
syscall
move $t1,$v0

#Le  o numero 2
li $v0,4
la $a0,n2
syscall
li $v0,5        #Prepara o processador v0 para  receber um inteiro
syscall
move $t2,$v0

sub $t3,$t1,$t2  #subtrai t1-t2 e coloca o valor em t3

#Mostra o resultado na tela 

li $v0,4
la $a0,r
syscall
li $v0,1
la $a0,($t3)
syscall

#Pula linha e volta para o menu criando um loop
pula_linha
jal main          #VOLTA PRO BLOCO DE CODIGO DO MAIN


#BLOCO MULTIPLICAR
multiplicar:         
#Le  o numero 1
li $v0,4          #Prepara o processador v0 para imprimir uma string
la $a0,n1          
syscall           #Executa
li $v0,5          #Prepara o processador v0 para  receber um inteiro
syscall
move $t1,$v0

#Le  o numero 2
li $v0,4
la $a0,n2
syscall
li $v0,5        #Prepara o processador v0 para  receber um inteiro
syscall
move $t2,$v0

mul $t3,$t1,$t2  #subtrai t1-t2 e coloca o valor em t3

#Mostra o resultado na tela 

li $v0,4
la $a0,r
syscall
li $v0,1
la $a0,($t3)
syscall

#Pula linha e volta para o menu criando um loop
pula_linha
jal main          #VOLTA PRO BLOCO DE CODIGO DO MAIN


#BLOCO DIVIDIR

dividir:         
#Le  o numero 1
li $v0,4          #Prepara o processador v0 para imprimir uma string
la $a0,n1          
syscall           #Executa
li $v0,5          #Prepara o processador v0 para  receber um inteiro
syscall
move $t1,$v0

#Le  o numero 2
li $v0,4
la $a0,n2
syscall
li $v0,5        #Prepara o processador v0 para  receber um inteiro
syscall
move $t2,$v0

div $t3,$t1,$t2  #subtrai t1-t2 e coloca o valor em t3

#Mostra o resultado na tela 

li $v0,4
la $a0,r
syscall
li $v0,1
la $a0,($t3)
syscall

#Pula linha e volta para o menu criando um loop
pula_linha
jal main          #VOLTA PRO BLOCO DE CODIGO DO MAIN

#BLOCO DE CODIGO SAIR

sair:
li $v0,10
syscall
