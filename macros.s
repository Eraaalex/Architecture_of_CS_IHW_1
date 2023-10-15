

.macro input_array_(%array_size, %array_adress)
	# Save the array size value to the stack for transmission to the function input_array
	addi sp, sp, -4 
	sw %array_size, (sp)
	la a1 %array_adress # Save the array adress value for transmission to the function input_array
   jal input_array
.end_macro

.macro output_array_(%array_size, %array_adress) 
	mv a0 %array_size  # Save the array adress value for transmission to the function input_array
	la a1 %array_adress # Save the array adress value into fegister a1 for transmission to the function output_array
    	jal output
.end_macro

.macro convert_array_(%array_size, %array_adress_A, %array_adress_B) 
	# Save the array size value to the register (a0) and array adress to the register (a1)
	# for transmission to the function convert array (input array B)
	mv a0 %array_size
	la a1 %array_adress_A
	la a3 %array_adress_B
    	jal convert_array
.end_macro

.macro add_element(%adress, %value) # add element to the adress of array and moves array the pointer
        sw %value (%adress)   # Save a0 into array
        addi %adress %adress 4
.end_macro


 .macro print_str (%x)
   .data
str:
   .asciz %x
   .text
   push(a0)
   li a7, 4
   la a0, str
   ecall
   pop(a0)
.end_macro
   
   
# Saving the specified register on the glass
.macro push(%x)
	addi	sp, sp, -4
	sw	%x, (sp)
.end_macro

# Pushing a value from the top of the stack into a register
.macro pop(%x)
	lw	%x, (sp)
	addi	sp, sp, 4
.end_macro


.macro read_int_a0
   li a7, 5
   ecall
.end_macro

.macro print_int (%x)
	li a7, 1
	mv a0, %x
	ecall
.end_macro

.macro check_size_(%size)
 # Save the array size value to the stack for transmission to the function check_size
	addi sp, sp, -4 
	sw a0, (sp)
	jal check_size
	addi sp sp 4      # Clear stack after function
.end_macro
