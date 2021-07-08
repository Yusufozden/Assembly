#####################################
# a[i] = a[i] + a[i+1]
#####################################

.data
a:		.word 1 ,2 ,3 ,4 ,5
i:		.word 3


.text
	.globl main
main:
        #-----------------------------------------------------------------
	la $s6, a      # load address of a into $s6
    lw $s5, i      # load address of i into $s5
	    #-----------------------------------------------------------------

	sll $t3, $s5, 2
        add $t0, $t3, $s6  # $t0 is address of array which is index 0.
        lw $t1 , 0($t0)  # $t1 = a[i]
        lw $t2 , 4($t0)  # $t2 = a[i+1] I have incremented 4 byte to switch next index.
        add $t1 , $t1 , $t2 # a[i] = a[i] + a[i+1]
        sw  $t1, 0($t0) #  a[i] = $t1
        lw $t6,0($t0)   #  $t6 = a[i] I wanted to prove the saved value is in  a[i].

EXIT:
	#-----------------------------------------------------------------
	move $a0, $t6
	li $v0, 1           # syscall number 1 will print int in $a0
	syscall
	li $v0, 10          # Syscall number 10 is to terminate the program
	syscall             # exit now
	#-----------------------------------------------------------------
