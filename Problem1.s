# Title: Project 1	Filename: Problem 1

# Author: Augustus Crosby	Date: 9/17/2020

# Description: switch all user-entered uppercase to lower case & vise versa

# Input: user-entered ex. "Welcome To Computer Architecture Class"

# Output: wELCOME tO cOMPUTER aRCHITECTURE cLASS

################# Data segment #####################

.data

 line1: .asciiz "Enter a string:\n"
 line2: .asciiz "The result string is: "
 input: .space 50 # change if needed longer

################# Code segment #####################

.text

.globl main

main:	# main program entry

la $a0, line1
li $v0, 4
syscall 

li $v0, 8
la $a0, input
li $a1, 50  # to specify how many characters, change if needed
syscall

li $t0, 0


loop1:
lb $t1, input($t0)  #load first char (1 byte)

beqz $t1, exit # if it's 0 it's ended
blt $t1, 65, nextchar # if it's less than 65 'A', not doing anything
bgt $t1, 122, nextchar # if it's more than 122 'z' not doing anything

ble $t1, 90, uppercase # if what's left is less than or equal to 90 it's uppercase
ble $t1, 122, lowercase # the rest should be lowercase, but did this incase of an error
j exit


nextchar: # just to simplify nextcharacter in all outcomes
addi $t0, $t0, 1
j loop1


uppercase:
addi $t1, $t1, 32 #adding 32 to the ascii identifier makes it lowercase
sb $t1, input($t0) #storing it back
j nextchar


lowercase:
subi $t1, $t1, 32 #opposite
sb $t1, input($t0)
j nextchar


exit:
li $v0, 4
la $a0, line2
syscall
la $a0, input
syscall


li $v0, 10	# Exit program

syscall

