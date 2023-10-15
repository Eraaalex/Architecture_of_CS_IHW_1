# Automated Testing Program for array 
.include "macros.s"
.global test
# Test Data
.data
array_A1: .word 5, 3, 7, 2, 8
array_B1: .space 40 # Assuming enough space for array B
array_right_result: .word 7, 8
n1: .word 5

array_A2: .word 5,4,3,2,1
array_B2: .space 40 
n2: .word 5

n3: .word 11
n4: .word -4

array_A5: .word 10,10,10
array_B5: .space 40 
n5: .word 3

array_A6: .word 1
array_B6: .space 40 
n6: .word 1

# Test Cases
.text
test:
   lw a0 n1
   print_str(" A = {5, 3, 7, 2, 8}\n")
   convert_array_(a0, array_A1, array_B1)
   print_str("Expected result B = {7,8}\n")
   print_str("Array B: \n")
   output_array_(a1, array_B1)
   print_str("-----------\n")
   
   lw a0 n2
   print_str(" A = { 5,4,3,2,1}\n")
   convert_array_(a0, array_A2, array_B2)
   print_str("Expected result: empty output\n")
   print_str("Array B: \n")
   output_array_(a1, array_B2)
   print_str("-----------\n")
   
   lw a0 n3
   print_str("size = 11; Expected: register a0 = 0\n")
   print_str("a0 = ")
   check_size_(a0)
   print_int(a0)
   print_str("\n-----------\n")
   
   
    lw a0 n4
    print_str("size = -4; Expected: register a0 = 0 \n")
    print_str("a0 = ")
    check_size_(a0)
    print_int(a0)
    print_str("\n-----------\n")
    
    lw a0 n5
   print_str(" A = { 10,10,10 }\n")
   convert_array_(a0, array_A5, array_B5)
   print_str("Expected result: empty output\n")
   print_str("Array B: \n")
   output_array_(a1, array_B5)
   print_str("-----------\n")
   
    lw a0 n6
   print_str(" A = { 1 }\n")
   convert_array_(a0, array_A6, array_B6)
   print_str("Expected result: empty output \n")
   print_str("Array B: \n")
   output_array_(a1, array_B6)
   print_str("-----------\n")
  
		
    
end_test:
    # Exit the program
    li a7, 10       # Exit system call number
    ecall
    


