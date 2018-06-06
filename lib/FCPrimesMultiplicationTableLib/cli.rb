require_relative 'MathServices/mathServices'

module FCPrimesMultiplicationTableLib


    #
    # Class that represents the Command-Line-Interface (CLI) for the library.
    # Use CLI.run to execute the logic.
    #
    class CLI

        MATH_SERVICES = FCPrimesMultiplicationTableLib::MathServices;

        # The main entry point of the program.
        # Executes the logic of the coding challenge.
        def self.run()

            parseCommandLine

            if helpRequested?
                 displayUsage
            else
                generatePrimes
                computeCellSize
                displayGrid
            end
        end

        private

        # Computes and initializes the @@primes array with numbers.
        def self.generatePrimes

            algorithm = MATH_SERVICES::PrimeNumFinder.new
            @@primes = algorithm.getFirstNPrimes numberOfPrimes 
        end

        # Computes the @@cellSize (in characters count) for the output grid.
        def self.computeCellSize

            @@maxProduct = MATH_SERVICES.getMaxValueSquared! @@primes
            @@cellSize = @@maxProduct.to_s.length + FCPrimesMultiplicationTableLib::MIN_CELL_LEFT_PADDING

            if @@cellSize < FCPrimesMultiplicationTableLib::MIN_CELL_WIDTH
                @@cellSize = FCPrimesMultiplicationTableLib::MIN_CELL_WIDTH
            end
        end

        # Renders the result prime numbers multiplication table.
        def self.displayGrid

            puts ""
            displayGridHeader
            @@primes.each { |prime| displayGridRow prime }
            puts ""
        end

        # Renders the header row of the multiplication table.
        def self.displayGridHeader

            printf "%+#{@@cellSize}s|", ""
            @@primes.each {
                |value|
                printf "%+#{@@cellSize}s|", value
            }
            printf "\n"

            cellSeparator = "-" * @@cellSize + "+"
            rowSeparator = cellSeparator * (@@primes.length + 1) #number of cells in a row

            puts rowSeparator
        end

        # Renders a single row of the multiplication table
        # with multiplication products for a single prime number.
        def self.displayGridRow (primeNum)
            printf "%+#{@@cellSize}s|", primeNum
            @@primes.each {
                |value|
                printf "%+#{@@cellSize}s|", MATH_SERVICES.multiplyArgs(primeNum, value)
            }
            printf "\n"
        end

        # Injests command line arguments into a hash.
        # Recognizes one of the following patterns
        #   --setting=value
        #   -setting=value
        #   --command
        #   -command
        def self.parseCommandLine

            @@cmdArgs = Hash[ ARGV
                .join(' ')
                .scan(/--?([^=\s]+)(?:=(\S+))?/) ]
        end

        # Returns the number of prime numbers to be generated
        def self.numberOfPrimes

            @@cmdArgs["count"] || FCPrimesMultiplicationTableLib::DEFAULT_NUM_COUNT
        end

        # Returns an indication, if a --help/-help command was provided
        # as a command line argument
        def self.helpRequested?

            @@cmdArgs.key?("help")
        end

        # Displays the basic usage of the progam via command line interface
        # Uses standard output.
        def self.displayUsage
        
            puts %{
USAGE: 
        ./primes-gen --count=<count> --help

        --help, -help       Command that triggers the display of this text

        --count, -count     Configures the number of prime numbers to be 
                            generated. If not specified explicitly, a default 
                            value of 10 is used.
            }
        end
    end
end