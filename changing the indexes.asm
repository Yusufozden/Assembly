##########################################
# while(i<10){
#  if (7<a[i]){
# 	b[i]=11
#  }
#  else b[i]=a[i]
# }
##########################################
.data
array:	.word 31, 2, 7, 6, 7, 8, 3, 4, 5, 67
MyArray: .space 40
gap:	.asciiz " "
i:	.word 11
printa:	.asciiz "\nindex["
printb:	.asciiz "]= "
.text
	.globl main
main:
	la $s0, array
	la $s4, MyArray
	sub $s1, $s1, $s1 #counter
	lw $s3, i
	li $s5, 7

Loop:
	beq $s1, 10, Exit
	sll $t0, $s1, 2
	add $t1, $t0, $s0
	lw $a0, 0($t1)
	sw $a0, MyArray($t0)
	addi $s1, $s1, 1

	slt $s2, $s5, $a0
	bne $s2, 1, Loop
	sw $s3, MyArray($t0)
	j Loop
	
	

Exit:
	move $s1, $zero
Loop2:
	li $v0, 4
	la $a0, printa # "index["
	syscall

	li $v0, 1
	move $a0, $s1 #counter
	syscall

	li $v0, 4
	la $a0, printb # "]= "
	syscall

	sll $t0, $s1, 2
	add $t1, $t0, $s4
	lw $a0, 0($t1)
	li $v0, 1
	syscall

	addi $s1, $s1, 1
	slt $s6, $s1, 10
	beq $s6, 1, Loop2

	li $v0, 10
	syscall