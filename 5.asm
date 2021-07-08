##########################################
# while(array[i] < n)
#     i += 1;
##########################################

.data
array:          .word 5, 23, 35, 42 , 53
i:              .word 0
n:              .word 30

.text
	.globl main
main:
	#-----------------------------------------------------------------
	    la $s2, array
        lw $s5, i
        lw $s6, n
	#-----------------------------------------------------------------
        
        
LOOP:
        sll $t0, $s5, 2 # $t0 = i * 4 which is offset value of array.
        add $t1, $s2, $t0 # $t1 is address of array which is index 0.
        lw  $t2, 0($t1) # $t2 = array[i]
	    slt $t3, $t2, $s6 # we looking for $t2 is less than $s6 to continue loop so $t3 must be 1.
        beq $t3, $zero, EXIT # if $t3 is zero, then it will jump EXIT section to finish program.
        addi $s5, $s5, 1 # add the 1 to the i value.
	j LOOP
EXIT:
	#-----------------------------------------------------------------
	move $a0, $s5
	li $v0, 1           # syscall number 1 will print int in $a0
	syscall
	li $v0, 10          # Syscall number 10 is to terminate the program
	syscall             # exit now
	#-----------------------------------------------------------------
	