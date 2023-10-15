.include "macros.s"
.global main

.data
array_A: .word 44
array_B: .word 44
new_line: .asciz "\n"

.text
main:	
	print_str("Input array size: ")
	
	read_int_a0
	
	mv s0 a0 # save array size into s0 register
	
	check_size_(s0) # # macro containing checking array size function
	
	beqz a0, incorrect_size_info  # if a0 = 0 size is incorrect 

	input_array_(s0, array_A) # macro containing an array input function
	
	convert_array_(s0, array_A, array_B) # Function wrapped in a macro returns size B in a1 register
	mv s1 a1 # save array size into s1 register

	print_str("Output array B: ")
	output_array_(s1, array_B)
	
	b exit # program completion label


incorrect_size_info:   # Returns information about the wrong size entered
	print_str("Incorrect input\n")
	b exit	
	
exit: 
	li s1 0   # Clear s1
	li s0 0     # Clear s0
	li a7 10    # Exit call
	ecall 			
	


		
	    
