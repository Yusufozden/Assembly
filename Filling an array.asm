
.data

    prompt: .asciiz "\nEnter a number: " # message
	space:	.asciiz " "
    myArray: .space 32

.text

main:
la $s0, myArray
sub $t0, $t0, $t0
while:            # while loop until bytes become 32(4*8)

    beq $t0,32,exit  

    li $v0,4    #loading message prompt ,syscall to print
    la $a0,prompt
	syscall
	
    li $v0,5    #user input
    syscall

    sw $v0, myArray($t0)


    addi $t0, $t0, 4 #increasingto index     
    j while     #loop back

exit:

	sub $s5, $s5, $s5
loop:
	sll $t1, $s5, 2
	add $s2, $t1, $s0
	lw $a0, 0($s2)
	li $v0, 1
	syscall
	li $v0, 4
	la $a0, space
	syscall
	addi $s5, $s5, 1
	bne $s5, 8, loop

li $v0,10
syscall
