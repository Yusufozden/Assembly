##########################################
# while (array[i] < n)
#      i++;
##########################################

.data
array:	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
i:		.word 1
n:		.word 7

.text
	.globl main
main:
	#-----------------------------------------------------------------
	la $s1, array
	lw $s2, i
	lw $s3, n
	#-----------------------------------------------------------------
LOOP:
	sll $t0, $s2, 2     # OFFSET = i * 4
	add $t1, $s1, $t0   # array[i] = BASE + OFFSET
	lw $t2, 0($t1)      # $t2 = value @ array[i]
	beq $t2, $s3, EXIT  # if (array[i] == n) exit loop
	addi $s2, $s2, 1    # i++
	j LOOP
EXIT:
	#-----------------------------------------------------------------
	move $a0, $s2
	li $v0, 1           # syscall number 1 will print int in $a0
	syscall
	li $v0, 10          # Syscall number 10 is to terminate the program
	syscall             # exit now
	#-----------------------------------------------------------------
