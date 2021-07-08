##########################################
# if (i < x) i = x;    # else i = y;
##########################################

.data
i:		.word 5
x:		.word 10
y:		.word 15

.text
	.globl main
main:
	#-----------------------------------------------------------------
	lw $s2, i
	lw $s3, x
	lw $s4, y
	#-----------------------------------------------------------------

	slt $t1, $s2, $s3   # if (i < x) $t1 = 1; else $t1 = 0;
	bne $t1, $zero, A
	lw $s1, y
	j EXIT
A:
	lw $s1, x
EXIT:
	#-----------------------------------------------------------------
	move $a0, $s1
	li $v0, 1           # syscall number 1 will print int in $a0
	syscall
	li $v0, 10          # Syscall number 10 is to terminate the program
	syscall             # exit now
	#-----------------------------------------------------------------
