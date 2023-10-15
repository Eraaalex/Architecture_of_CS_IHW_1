.global check_size
.include "macros.s"

# check_size: checks the entered array size n to satisfy the condition 11 > n > 0
# if it is true subprogram return 0 else 1
check_size:
	addi sp, sp, -4
	sw ra, (sp)
	
	addi  a0, sp, 4 # Read stack first element (array size)
	lw a1, (a0)
	li a0, 1   # Assumption that array size is correct, so a0 = 1
	
	li a2, 1     # Check if size < 1 a0 = 0
	blt a1, a2, incorrect_size_error
	
	li a2, 10   # Check if size > 10 a0 = 0
	blt a2, a1, incorrect_size_error
	
	end_check: # Restoring the stack (current ra)
	lw ra (sp)
	addi sp sp 4
	ret 	
	
	incorrect_size_error:
	li a0 0
	ret
	
