.global output
.include "macros.s"
# output: The subrogramm outputs an array according to the parameters passed through registers a1 
# (address of the beginning of the array), a0 (array length) 	
output:
		mv t2 a0
		addi sp, sp, -4
		sw ra, (sp)
		 mv t1, a1         # Load array address into t1 
		# Entering data into the array based on the quantity passed as an argument (passed via a0)
		blez t2 output_exit
		out:
		    	addi t2 t2 -1         # Reducing the length of the array when introducing an elmenet
		    	lw a0 (t1)         # Output element
		    	li a7 1
			ecall
			
		        addi t1 t1 4    
		        li a7 11           # Output \n
			li a0 10
			ecall   
		    	bgtz t2 out        # Comparing the counter and the border and switching to the input element

	       output_exit:
	        lw ra (sp)
		addi sp, sp, 4  
		ret	
		
