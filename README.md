# Coding Challenge: Prime Numbers Multiplication Table

This repository serves the result for a coding challenge with the following definition: 

* A *Ruby* program that prints out a multiplication table of the first 10 prime numbers. 
* The program runs from the command line and prints to screen a single table. 
* Across the top header and down the left lead of the table are the 10 primes, and the body of the table contains the product of multiplying these numbers.


## Solution

The program was developed an run with the following Ruby version:

```bash
ruby 2.5.0p0 (2017-12-25 revision 61468) [x86_64-linux]

```
No external gems or ruby files were used, I have relied on core Ruby functions only.

### Running the program

From the project root directory:

```bash
# Navigate and give permissions to shell script
cd bin/
chmod +755 primes-gen

# Display program options
./primes-gen --help

# Display a multiplication table for the first 10 primes
./primes-gen

# Display a multiplication table for the first 12 primes
./primes-gen --count=12

```

### Running the tests

The same principle, for a different script - 'primes-gen-tests'

```bash
cd bin/
chmod +755 primes-gen-tests
./primes-gen-tests

```

## Structure of the project tree

- bin/ Container for the shell scripts for end users
    - primes-gen is the main program script
    - primes-gen-tests is the test runnable
- lib/ Container for all ruby source code files, structured in a modular style
- tests/ Container for the ruby unit test files.

### Files of interest

- lib/FCPrimesMultiplicationLib/MathServices/primeNumFinder.rb contains the logic for looking up prime numbers
- lib/FCPrimesMultiplicationLib/MathServices/mathServices.rb contains some basic mathematical ops used by the program. Definitely over-engineered, with the intent of demonstrating some unit tests 
- lib/FCPrimesMultiplicationLib/MathServices/cli.rb contains the main logic for the command line interface

## Things that could be improved

- More elegant prime numbers algorithm, e.g. https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes or https://en.wikipedia.org/wiki/Sieve_of_Sundaram
- Removing reduntant mathematical ops and rely