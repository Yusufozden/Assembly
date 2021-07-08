.data
strName:    .asciiz "Yusuf Özden Altınkaya"
strStrudentId:    .asciiz "\n200101084\n"
strPromptFirst:	 .asciiz "Enter the first operand:" 
strPromptSecond: .asciiz "Enter the second operand:" 
strPromptThird:    .asciiz "Enter the third operand: "    
strResultAdd:    .asciiz "A + (B*C) =  "


.text
		.globl main
main:

		#STEP - 1 -- read name and studentId
                li $v0, 4
   	        la $a0, strName
                syscall

                li $v0, 4
                la $a0, strStrudentId
                syscall
               
		# STEP 2 -- get the first operand
		# Print a prompt asking user for input
		li $v0, 4   # syscall number 4 will print string whose address is in $a0       
		la $a0, strPromptFirst      # "load address" of the string
		syscall     # actually print the string  

		# Now read in the first operand 
		li $v0, 5      # syscall number 5 will read an int
		syscall        # actually read the int
		move $s0, $v0  # save result in $s0 for later

		# STEP 3 -- repeat above steps to get the second operand
		# First print the prompt
		li $v0, 4      # syscall number 4 will print string whose address is in $a0   
		la $a0, strPromptSecond      # "load address" of the string
		syscall        # actually print the string

		# Now read in the second operand 
		li $v0, 5      # syscall number 5 will read an int
		syscall        # actually read the int
		move $s1, $v0  # save result in $s1 for later

	 
		# STEP 4 -- get third operand
		# First print the prompt
		li $v0, 4      
		la $a0, strPromptThird      
		syscall        

		li $v0, 5      
		syscall        
		move $s2, $v0  
	 	mul $s1, $s1, $s2 # multiplication

                li $v0, 4      # syscall number 4 -- print string
	        la $a0, strResultAdd   
	        syscall 

  	 	# Then print the actual sum
	        li $v0, 1         
	        add $a0, $s0, $s1 # add our operands and put in $a0 
	        syscall           # actually print the int

		li $v0,10
                syscall
		
                li $v0,10
                syscall