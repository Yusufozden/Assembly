.data
array:	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
SPACE:	.asciiz " "
.text
		.globl main
main:
	la $s0, array
	li $t1, 10 #size of array
	sub $t0, $t0, $t0 #i=0  li $t0,0

loop:
	sll $t2, $t0, 2 # t2= ix4
	add $s1, $s0, $t2 
	lw $a0, 0($s1)	#a0=array [i]
	addi $t0, $t0, 1 #i++ 

	li $v0, 1
	syscall
	li $v0, 4
	la $a0, SPACE
	syscall
	
	addi $t1, $t1, -1
	bne $zero, $t1, loop

#------EXIT----------
	li $v0, 10 
	syscall 