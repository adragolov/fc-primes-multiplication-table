# Coding Challenge: Prime Numbers Multiplication Table

This repository serves the result for a coding challenge with the following definition: 

* A *Ruby* program that prints out a multiplication table of the first 10 prime numbers. 
* The program runs from the command line and prints to screen a single table. 
* Across the top header and down the left lead of the table are the 10 primes, and the body of the table contains the product of multiplying these numbers.


### Running the program

From the project root directory:

```
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

```
cd bin/
chmod +755 primes-gen-tests
./primes-gen-tests

```

### Structure of the project tree



### Additional Details

The program was developed an run with the following Ruby version:

```
ruby 2.5.0p0 (2017-12-25 revision 61468) [x86_64-linux]

```