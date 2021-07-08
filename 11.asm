##########################################
# for (i = 0; i < n; i++)
# x += y;
##########################################

.data
i:      .word 0
x:		.word 12
y:		.word 24
n:      .word 3

.text
	.globl main
main:
	#-----------------------------------------------------------------
	lw $s5, i
	lw $s3, x
	lw $s4, y
    lw $s6, n
	#-----------------------------------------------------------------      
        
LOOP:
	slt $t0, $s5, $s6 # we looking for $s1 is less than $s6 to continue looop so $t0 must be 1.
        beq $t0, $zero, EXIT # if $t0 is 0 , then it will jup to EXIT section to terminate the program.
        addi $s5, $s5, 1 # i = i + 1
		add $s3, $s3, $s4 # x =x + y
	j LOOP
EXIT:
	#-----------------------------------------------------------------
	move $a0, $s3
	li $v0, 1           # syscall number 1 will print int in $a0
	syscall
	li $v0, 10          # Syscall number 10 is to terminate the program
	syscall             # exit now
	#-----------------------------------------------------------------
