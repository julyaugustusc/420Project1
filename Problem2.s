# Title: Project 1	Filename: Problem 2

# Author: Augustus Crosby	Date: 9/17/2020

# Description: Sum of squares user inputs: pointer to the running total, and a pointer to the current element

# Input: array: .word 1,2,3,4,5

# Output: The result of updateSum is 55

################# Data segment #####################

.data

array: .word 1,2,3,4,5
size:  .word 5 #size of must be changed, I found this necessary to compare to an index value
line1: .asciiz "The result of updateSum is "

################# Code segment #####################

.text

.globl main

main:	# main program entry

#I think this is what is meant?

la $a1, array #current element pointer - addresses are pointers.
li $t0, 0

sub $sp, $sp, 4
sw $t0, 0($sp) #pointer to total - total just stored in stack

lw $t1, size
li $t3, 0 #index



updateSum: #uses $a1, $sp

lw $s0, 0($a1)
addi $t3, $t3, 1 #index (starts at 1)
bgt $t3, $t1, #exit exists when index > size

mult $s0, $s0 
mflo $t2 

lw $t0, 0($sp) #load old total
add $t0, $t0, $t2 #add to it
sw $t0, 0($sp) #store new total

addi $a1, $a1, 4 #move pointer to next

j updateSum


exit:
li $v0, 4
la $a0, line1
syscall

lw $a0, 0($sp)
li $v0, 1
syscall

add $sp, $sp, 4 #starting pointer put back

li $v0, 10	# Exit program

syscall

