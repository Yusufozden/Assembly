##########################################
# if (a[i] < a[i+1])
# a[i] = a[i-1];
##########################################

.data
a:		.word 0 ,10 ,5 ,20 ,13, 30
i:   	.word 4

.text
	.globl main
main:
        #-----------------------------------------------------------------
	    la $s6, a      # load address of a into $s6
        lw $s5, i      # load address of i into $s5
	
	    #-----------------------------------------------------------------
        sll $t6, $s5, 2  # $t6 = i * 4 which is offset value of array.
        add $t0, $s6, $t6  # $t0 is address of array which is index 0.
        lw $t1, 0($t0)  # $t1 = a[i]
        lw $t2, 4($t0)  # $t2 = a[i+1]
        slt $t3, $t1, $t2 # we looking for $t3 is equal 1 then we can go to B section.
        bne $t3, $zero, B # if $t3 is not equal $zero which is the situation we looking for, then we will go B section to make assignment.
         
        j EXIT # Otherwise which is $t3 is equal $zero, we will jump to EXIT section to terminate program.
B:
        lw $t7, -4($t0) # $t7 = a[i-1]
        sw $t7, 0($t0)  # a[i] = a[i-1]
        lw $t1, 0($t0)  # $t1 = a[i]

EXIT:
	#-----------------------------------------------------------------
	move $a0, $t1
	li $v0, 1           # syscall number 1 will print int in $a0
	syscall
	li $v0, 10          # Syscall number 10 is to terminate the program
	syscall             # exit now
	#-----------------------------------------------------------------
