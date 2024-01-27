set -x
echo "let Arithmetic expression"
# Addition
let "result = 5 + 3"  # result = 8


# Subtraction
let "result = result - 2"  # result = 6


# Multiplication
let "result *= 2"  # result = 12


# Division
let "result /= 3"  # result = 4


# Modulus
let "result %= 3"  # result = 1


# Bitwise AND
let "result &= 1"  # result = 1


# Bitwise OR
let "result |= 2"  # result = 3


# Bitwise XOR
let "result ^= 3"  # result = 0


# Bitwise left shift
let "result <<= 1"  # result = 0


# Bitwise right shift
let "result >>= 1"  # result = 0


echo "" 
echo "\n\$(( ))\n Arithmetic expression"
# Addition
result=$((5 + 3))  # result = 8


# Subtraction
result=$((result - 2))  # result = 6


# Multiplication
result=$((result * 2))  # result = 12


# Division
result=$((result / 3))  # result = 4


# Modulus
result=$((result % 3))  # result = 1


# Bitwise AND
result=$((result & 1))  # result = 1


# Bitwise OR
result=$((result | 2))  # result = 3


# Bitwise XOR
result=$((result ^ 3))  # result = 0



echo "" 
echo "expr Arithmetic expression"
# Addition
result=$(expr 5 + 3)  # result = 8


# Subtraction
result=$(expr $result - 2)  # result = 6


# Multiplication
result=$(expr $result \* 2)  # result = 12


# Division
result=$(expr $result / 3)  # result = 4


# Modulus
result=$(expr $result % 3)  # result = 1


