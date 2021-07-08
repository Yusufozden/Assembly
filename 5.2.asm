##########################################
#
# if (a[i]<a[i+1])
# 	i+=1
##########################################
.data

array:		.word 1, 4, 3, 4, 5, 6, 7, 8, 9, 10
notmet:		.asciiz "\ncondition not met. \n"
strAfter:	.asciiz "a[i]= "
stri:		.asciiz "\ni= "
i:		.word 1
.text
		.globl main
main:
		la $s0, array
		
		
		
		lw $s5, i
	
		sll $t0, $s5, 2
		add $s2, $t0, $s0 
		lw $a0, 0($s2)	
		
		addi $t1, $s5, 1
		sll $t0, $t1, 2
		add $s2, $t0, $s0 
		lw $a1, 0($s2) 
		
		slt $t1, $a0, $a1
		beq $t1, 1, L
	E:
		li $v0, 4            
		la $a0, notmet
		syscall
		li $v0, 4            
		la $a0, strAfter
		syscall
		sll $t0, $s5, 2
		add $s2, $t0, $s0
		lw $a0, 0($s2)
		li $v0, 1
		syscall
		li $v0, 4            
		la $a0, stri
		syscall
		lw $a0, i
		li $v0, 1
		syscall
		li $v0, 10
		syscall
		
	L: 	
		li $v0, 4            
		la $a0, strAfter
		syscall
		sll $t0, $s5, 2
		add $s2, $t0, $s0
		lw $a0, 0($s2)
		li $v0, 1
		syscall
		li $v0, 4            
		la $a0, stri
		syscall
		addi $s5, $s5, 1
		move $a0, $s5
		li $v0, 1
		syscall
		li $v0, 10
		syscall

		