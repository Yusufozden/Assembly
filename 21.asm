##########################################
# if (i < x) i = x;
# else i = y;
##########################################

.data
i:		.word 9
x:		.word 10
y:		.word 20

.text
	.globl main
main:
	#-----------------------------------------------------------------
	lw $s1, i
	lw $s2, x
	lw $s3, y
	#-----------------------------------------------------------------

	slt $t1, $s1, $s2   # if (i < x) $t1 = 1; else $t1 = 0;
	beq $t1, $zero, L
	lw $s1, x
	j EXIT
L:
	lw $s1, y
EXIT:
	#-----------------------------------------------------------------
	move $a0, $s1
	li $v0, 1           # syscall number 1 will print int in $a0
	syscall
	li $v0, 10          # Syscall number 10 is to terminate the program
	syscall             # exit now
	#-----------------------------------------------------------------
