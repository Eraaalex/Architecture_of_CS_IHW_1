.global input_array
.include "macros.s"

# Subprogramm is entering data into an array based on the quantity passed as an argument (via stack)
# at each step, we reduce the number of remaining elements to add (register t2)
input_array:
	addi sp, sp, -4
	sw ra, (sp)
	
	addi  a0, sp, 4 # Read parameter (array size) in t2 register
	lw t2, (a0) 
	mv t1  a1
	# loop: Entering data into an array based on the quantity passed as an argument (via stack)
	# at each step, we reduce the number of remaining elements to add (register t2)
	loop:
	    addi t2 t2 -1         # Reducing the length of the array when introducing an elmenet
	    input: 
	       	read_int_a0
        	add_element(t1, a0)
	bgtz t2 loop        # Checking for the end of the output
	
        lw ra (sp)     # Restoring the stack (current ra)
	addi sp, sp, 4 
	
	ret