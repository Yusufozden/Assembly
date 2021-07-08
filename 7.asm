###############################
# if (a[i] > 10)
# i = i+1;
###############################

.data
a:		.word 1 ,2 ,3 ,4 ,10, 11
i:   	.word 5

.text
	.globl main
main:
        #-------------------------------------------------------------
	    la $s6, a      # load address of a into $s6
        lw $s5, i      # load address of i into $s5

	    #-----------------------------------------------------------------
        sll $t3, $s5, 2
        add $t0, $s6, $t3  # $t0 is address of array which is index 0.
        lw $t1 , 0($t0)  # $t1 = a[i]
        slti $t2 , $t1, 10
        beq $t2 , $zero, L
        j EXIT
L:
        addi $s5, $s5, 1    

EXIT:
	#-----------------------------------------------------------------
	move $a0, $s5
	li $v0, 1           # syscall number 1 will print int in $a0
	syscall
	li $v0, 10          # Syscall number 10 is to terminate the program
	syscall             # exit now
	#-----------------------------------------------------------------
