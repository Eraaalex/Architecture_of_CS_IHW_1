.global convert_array
.include "macros.s"

#convert_array: The subprogram composes an array B from the elements of array A. 
# As arguments, the function takes the size of the array (A) from which the second array will be composed, the address A,
# the address of the array being composed (B)
#First, it pre-saves the previous element and compares it with the current one if previous > current, current elemet is added to array B
# otherwise the addition is skipped.		
convert_array:
	addi sp, sp, -4
	sw ra, (sp)
	mv t1, a1         	# Load array A address into t1 
	mv t2 a0  		# Load array A length into t2
	mv t0 a3		# Load array B adress into t0
	addi t2 t2 -1         	# Reducing the length of the array when readinging an elmenet in array A
	li a1 0 		# init array B length
	blez t2 end_output  # if array A  < 2 element
    	lw t3 (t1)         	# Get fisrt array A element	
        addi t1 t1 4    	# Moving the array A pointer
	input_B:
		addi t2 t2 -1           # Reducing the length of the array A when introducing an elmenet
	    	lw t4 (t1)         	# Get next array A element
	    	bge t3 t4 skip_add
		add_element:
			addi a1 a1 1
			add_element(t0, t4) # Save t0 into array B
	      	skip_add:  
	      		addi t1 t1 4 
		        mv t3 t4  	# Changes previous value to current
			bgtz t2 input_B
	end_output: 
		lw ra (sp)
		addi sp, sp, 4
		ret	# return array B size in register a1
