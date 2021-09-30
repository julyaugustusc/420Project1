# Title: Project 1	Filename: Problem3

# Author: Augustus Crosby	Date: 9/17/2020

# Description: find the sum of absolute differences between consecutive elements in array using recursion

# Input: array: .word 5,4,3,2,1

# Output: The computed result is 4

################# Data segment #####################

.data

array: .word 5,4,3,2,1
size:  .word 5 #must change this if necessary
line1: .asciiz "The computed result is "

################# Code segment #####################

.text

.globl main

main:	# main program entry

la $a0, array #pointer of start of array
lw $s1, size #size
li $a1, 1 #current index (starts at 1)

compute: #index = $s0, array(address) = $a0, but array address will never change
blt  $a1, $s1, recurse

li $v0, 0 # I just said the base case was 0 because you can add 0 and nothing changes ie. (2-1) + 0

jr $ra

recurse:

sub $sp, $sp, 16
sw $ra, 0($sp) #store all values i might need
sw $a0, 4($sp)
sw $a1, 8($sp)

#(i-(i+1))

lw $t0, 0($a0) #index i
lw $t1, 4($a0) #index i+1
sub $v0, $t0, $t1

sw $v0, 12($sp)

# (move to next int in order to add)

addi $a0, $a0, 4 
addi $a1, $a1, 1

jal compute

lw $t2, 12($sp)
add $v0, $v0, $t2 #add as final step

lw $t3, 8($sp) #load check

lw $ra, 0($sp) #set return address
addi $sp, $sp, 16 #go out of $sp

beq $t3, 1, exit # so to exit properly and not end in an error

jr $ra



exit:
move $t0, $v0

li $v0, 4
la $a0, line1
syscall

li $v0, 1
move $a0, $t0
syscall

li $v0, 10	# Exit program

syscall

