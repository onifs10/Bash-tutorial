
>[!note] Resources
> [Bash Manual](https://www.gnu.org/software/bash/manual/bash.html)
> [Shell built in commands](https://www.gnu.org/software/bash/manual/bash.html#index-_003a)
## **What is Bash?**

- Bash (Bourne Again SHell) is a command language interpreter for Unix and Unix-like operating systems.
- It is the default shell on most Linux distributions and macOS.
- In unix file system. everything is represented as a file in unix. Processes , I/O buffers and other drivers are represented as a files in unix.

## Useful BASH commands

>[!important] Most useful command in BASH
> **man**  <command> - this command is used to load the manual for any command  
### Other Commands
1. **ls**: List directory contents
    - Example: `ls`, `ls -l`, `ls -a`
2. **cd**: Change directory
    - Example: `cd /path/to/directory`, `cd ..`
3. **pwd**: Print working directory
    - Example: `pwd`
4. **mkdir**: Make directory
    - Example: `mkdir new_directory`
5. **rm**: Remove files or directories
    - Example: `rm file.txt`, `rm -r directory`
6. **cp**: Copy files or directories
    - Example: `cp file.txt /path/to/destination`, `cp -r directory /path/to/destination`
7. **mv**: Move or rename files or directories
    - Example: `mv file.txt new_location`, `mv old_name new_name`
8. **touch**: Create an empty file or update file timestamps
    - Example: `touch new_file.txt`
9. **cat**: Concatenate and display file content
    - Example: `cat file.txt`
10. **grep**: Search text patterns in files
    - Example: `grep "pattern" file.txt`, `grep -r "pattern" /path/to/directory`
11. **echo**: Display a line of text
    - Example: `echo "Hello, World!"`
12. **chmod**: Change file permissions
    - Example: `chmod +x script.sh` (make script executable)
13. **chown**: Change file owner and group
    - Example: `chown user:group file.txt`
14. **sudo**: Execute a command with superuser privileges
    - Example: `sudo apt-get update`
15. **wc**: Count lines, words, or characters in a file
    - Example: `wc -l file.txt`
16. **head**: Output the first part of files
    - Example: `head -n 10 file.txt` (show first 10 lines)
17. **tail**: Output the last part of files
    - Example: `tail -n 5 file.txt` (show last 5 lines)
18. **find**: Search for files in a directory hierarchy
    - Example: `find /path/to/directory -name "*.txt"`
19. ps: to list out processes currently running on the machine

## **Why Bash Scripting?**

- Automate repetitive tasks: Bash scripts can automate various tasks, saving time and effort.
- System administration: Manage and configure systems efficiently.
- Customization: Customize workflows and processes according to specific needs.

##  Basics of Bash Scripting
- **Shebang:** `#!/bin/bash` specifies the interpreter to use.
- **Comments:** `#` is used for comments.
- **Variables:** Declared without a data type (`VAR_NAME=value`).
- **Control Structures:** `if`, `else`, `elif`, `for`, `while`, `case`.
- **Functions:** Defined using `function_name() { ... }`.
- **Command Substitution:** `$(command)` or `` `command` `` executes a command and returns its output.
- **Redirects and Pipes:** `>`, `>>`, `<`, `|` for I/O redirection and piping.
### Shebang 
This used to specify the interpreter to use to execute a file, if the file is an executable type

```bash
#!/bin/bash
```

### Comments 
like every other programming language you can add comment to your bash script, comments are written with `#` starting the line
```bash
# This is a comment
```

### Variables
In Bash scripting, there are primarily three types of variables:

1. **Scalar Variables:**
    - Scalar variables hold a single value.
    - They are analogous to variables in other programming languages.
    - Examples:
```bash
    name="John" age=25 
```

2. **Arrays:**
    - Arrays are collections of scalar variables.
    - They allow storing multiple values under a single variable name.
    - Indexed from 0 onwards.
    - Examples:
```bash
fruits=("apple" "banana" "orange") 
numbers=(10 20 30 40)
```
        
3. **Special Variables:**
    - Special variables have predefined meanings and are provided by the shell.
    - They contain information such as command line arguments, exit status of the last command, etc.
    - Examples:
        - `$0`: Name of the script.
        - `$1`, `$2`, ...: Positional parameters (command line arguments).
        - `$#`: Number of positional parameters.
        - `$$`: PID (Process ID) of the script.
        - `$?`: Exit status of the last command.
        - `$@`: All positional parameters as separate quoted strings.
        - `$*`: All positional parameters as a single string.
### Control Structures
Control structures in Bash scripting allow you to control the flow of execution based on conditions, loops, and function definitions. Here's a more detailed explanation of the main control structures in Bash:

1. **Conditional Statements (if-else):**
    - `if` statements allow you to execute a block of code based on a condition.

```bash
if condition; then
    # code to execute if condition is true
elif another_condition; then
    # code to execute if another_condition is true
else
    # code to execute if none of the above conditions are true
fi

## Example
if [[ $age -ge 18 ]]; then
    echo "You are an adult."
else
    echo "You are a minor."
fi

```

2. **Loops:**
 - **For Loop:** Iterates over a list of items or a range of numbers.
```bash
for variable in list; do
    # code to execute for each iteration
done
## Example
for fruit in apple banana orange; do
    echo "I like $fruit"
done
```

- **While Loops**: Executes a block of code repeatedly as long as a condition is true.
``` bash
while condition; do
    # code to execute as long as condition is true
done

# Example
counter=0
while [[ $counter -lt 5 ]]; do
    echo "Count: $counter"
    ((counter++))
done

```

- **Case Statement:** Provides a more elegant way to handle multiple conditions.
```bash
case expression in
    pattern1)
        # code to execute if expression matches pattern1
        ;;
    pattern2)
        # code to execute if expression matches pattern2
        ;;
    *)
        # code to execute if expression doesn't match any pattern
        ;;
esac

# Example
case $day in
    "Mon"|"Tue"|"Wed"|"Thu"|"Fri")
        echo "Weekday"
        ;;
    "Sat"|"Sun")
        echo "Weekend"
        ;;
    *)
        echo "Invalid day"
        ;;
esac

```

### Function Definitions
Allow you to define reusable blocks of code.

```bash
function_name() {
    # code to execute
}

# Example
greet() {
    echo "Hello, $1!"
}
greet "Alice"

# you can also use the function keyword
function print_hell(){
	echo "Hello World"
}

# using return 
function add(){
  return (( $1 + $2 ))
}

add 1 2
echo $? # printing the result from the function

# Arguments are passed to a function using special vaiables
``` 


### Arithmetic Expression
Arithmetic operations in Bash scripting allow you to perform mathematical calculations within your scripts. Bash provides several ways to perform arithmetic operations, including built-in arithmetic expressions, the `expr` command, and arithmetic expansion using `$((...))`. Here's an overview of each method:
#### **Arithmetic Expansion with `$((...))`:**

- Bash supports arithmetic expansion by enclosing the expression within `$((...))`.
- You can perform addition, subtraction, multiplication, division, and modulus operations using this method.
```bash
# Addition
result=$((5 + 3))  # result = 8

# Subtraction
result=$((10 - 4))  # result = 6

# Multiplication
result=$((3 * 6))  # result = 18

# Division
result=$((20 / 4))  # result = 5

# Modulus
result=$((10 % 3))  # result = 1
```

#### **Using `let` for Arithmetic Operations:**

- The `let` command allows you to perform arithmetic operations within a script.
- It is particularly useful when you need to update the value of a variable based on an arithmetic expression.
```bash
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

```

#### **Using `expr` Command:**

- The `expr` command evaluates expressions and performs arithmetic operations.
- It is useful when you need to perform arithmetic operations within a shell script and capture the result.

```bash
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

```
### Redirects and pipes
1. **Output Redirection (`>` and `>>`):**
    - `>`: Redirects standard output (stdout) of a command to a file. If the file doesn't exist, it creates a new one. If the file exists, it overwrites its contents.
        - Example: `ls > file.txt` (redirects output of `ls` command to `file.txt`)
    - `>>`: Appends stdout of a command to a file. If the file doesn't exist, it creates a new one. If the file exists, it appends to its contents.
        - Example: `echo "Hello" >> file.txt` (appends "Hello" to `file.txt`)
    - `<`: Redirects contents of a file to the standard input (stdin) of a command.
        - Example: `wc -l < file.txt` (counts lines in `file.txt`)
3. **Error Redirection (`2>` and `2>&1`):**
    
    - `2>`: Redirects standard error (stderr) of a command to a file.
        - Example: `command_that_generates_error 2> error.txt` (redirects error output to `error.txt`)
    - `2>&1`: Redirects stderr to stdout. Useful for capturing both stdout and stderr in a single file.
        - Example: `command_that_generates_error 2>&1 > output_and_error.txt`

**Pipes (`|`):**

Pipes allow you to send the output of one command as input to another command. This is useful for chaining multiple commands together.

- Example: `ls | grep ".txt"` (lists files and directories, then filters for lines containing ".txt")

**Combining Redirects and Pipes:**

You can combine redirects and pipes to perform more complex operations:

- Example: `cat file.txt | grep "pattern" > output.txt` (reads `file.txt`, filters lines containing "pattern", and saves the result to `output.txt`)

**Use Cases:**

- **Data Manipulation:** Redirects and pipes are commonly used to manipulate and process data, such as filtering, sorting, or transforming text files.
- **Logging and Error Handling:** Redirects help capture command output for logging or error handling purposes.
- **Automation:** They facilitate automation by allowing the output of one command to serve as input for another, enabling seamless workflow integration.
### Operators
1. **Numeric Comparison:**
    - `-eq`: Equal to
    - `-ne`: Not equal to
    - `-gt`: Greater than
    - `-lt`: Less than
    - `-ge`: Greater than or equal to
    - `-le`: Less than or equal to
2. **String Comparison:**
    - `=`: Equal to (within `[[ ... ]]`)
    - `!=`: Not equal to (within `[[ ... ]]`)
    - `<`: Less than (within `[[ ... ]]`)
    - `>`: Greater than (within `[[ ... ]]`)
3. **File Comparison:**
    - `-e`: File exists
    - `-f`: File is a regular file
    - `-d`: File is a directory
    - `-s`: File is not empty (has size greater than zero)
    - `-r`: File is readable
    - `-w`: File is writable
    - `-x`: File is executable
4. **Logical Operators:**
    - `!`: Logical NOT
    - `-a`: Logical AND (default, can be omitted)
    - `-o`: Logical OR
5. **Pattern Matching:**
    - `=~`: Pattern matching with regular expressions (within `[[ ... ]]`)
    - `==`: Pattern matching with wildcards (within `[[ ... ]]`)
6. **Other Operators:**
    - `&&`: Logical AND (short-circuit evaluation)
    - `||`: Logical OR (short-circuit evaluation

```bash
# Numerical Comparisons
if [[ $age -gt 18 && $age -lt 60 ]]; then
    echo "You are eligible for the job."
fi

# pattter matching
if [[ $gender == "male" || $gender == "female" ]]; then
    echo "Gender is valid."
fi

# File operators
if [[ -e "$file" && -r "$file" ]]; then
    echo "File exists and is readable."
fi
```
### Sample Bash script

```bash
#!/bin/bash

# This is a simple Bash script to greet the user

# Define a variable
NAME="John"

# Print a greeting
echo "Hello, $NAME! Welcome to Bash scripting."

# Example of an if-else control structure
if [ "$NAME" == "John" ]; then
    echo "You have a common name!"
else
    echo "Your name is unique!"
fi

# Example of a for loop
echo "Counting to 3:"
for i in {1..3}; do
    echo $i
done

# Example of a function
function say_goodbye() {
    echo "Goodbye, $NAME!"
}

# Call the function
say_goodbye

```


## Debug and troubleshoot bash Script
### Set the `set -x` option
One of the most useful techniques for debugging Bash scripts is to set the `set -x` option at the beginning of the script. This option enables debugging mode, which causes Bash to print each command that it executes to the terminal and output of each line after the command 

```bash
#!/bin/bash

set -x

# Your script goes here
```

### Check the exit code

When Bash encounters an error, it sets an exit code that indicates the nature of the error. You can check the exit code of the most recent command using the `$?` variable. A value of `0` indicates success, while any other value indicates an error.

```bash
#!/bin/bash

# Your script goes here

if [ $? -ne 0 ]; then
    echo "Error occurred."
fi
```

### Use `echo` statements

Another useful technique for debugging Bash scripts is to insert `echo` statements throughout your code. This can help you identify where errors are occurring and what values are being passed to variables.

```bash
#!/bin/bash

# Your script goes here

echo "Value of variable x is: $x"

# More code goes here
```

### Use the `set -e` option

If you want your script to exit immediately when any command in the script fails, you can use the `set -e` option. This option will cause Bash to exit with an error if any command in the script fails, making it easier to identify and fix errors in your script.

```bash
#!/bin/bash

set -e

# Your script goes here
```