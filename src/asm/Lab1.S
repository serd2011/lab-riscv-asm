.data
N:
.word 6
M:
.word 6
matrix:
.word 99, 67, 55, 68, 11,  4
.word  1, 43, 41, 10, 17,  0
.word 33, 81, 78, 34, 71, 37
.word 45,  9, 63, 53, 15, 49
.word 63, 81, 88, 46, 25, 76
.word 68,  7, 59, 86, 24, 76
result:
.word 0

.text

main:
lw a0, M
lw a1, N
la a2, matrix
call maxRow
mv a1, a0
lw a0, M
call printResult
call exit


# Prints row elements
# a0 - number of elements in a row
# a1 - address of the row
printResult:
mv t0, a0
mv t1, a1

# Element interation
1:
# Print element
addi a0, x0, 1
lw   a1, 0(t1)
ecall
# Print space
addi a0, x0, 11
addi a1, x0, 32
ecall

addi t1, t1, 4
addi t0, t0, -1
bnez t0, 1b
ret


# Ends the program
exit:
addi a0, x0, 10
ecall


# Finds row with the maximum sum
# a0 - number of rows
# a1 - number of columns
# a2 - address of the matrix
# returns:
# a0 - address of the found row
maxRow:
# t0 - max sum
# t1 - address of the max row
# t2 - column iterator
# t3 - sum of the row
# t4 - address of the row
# t5 - current element value

# init
mv t0, x0
lui t0, 0x80000

# Row interation
1:
mv t2, a1
mv t3, x0
mv t4, a2

# Row element iteration
2:
lw t5, 0(a2)
add t3, t3, t5
addi a2, a2, 4
addi t2, t2, -1
bnez t2, 2b

# Sum comparison
ble  t3, t0, 3f
mv t0, t3
mv t1, t4

3:
addi a0, a0, -1
bnez a0, 1b

mv a0, t1 # Return max row address
ret
