require_relative "FCPrimesMultiplicationTableLib/MathServices/mathServices"
require_relative "FCPrimesMultiplicationTableLib/libInfo"
require_relative "FCPrimesMultiplicationTableLib/cli"

module FCPrimesMultiplicationTableLib 

    # The default number of prime numbers to be generated unless
    # a --count or -count command line argument is provided
    DEFAULT_NUM_COUNT = 10
    # The minimum cell width (in character count) to be used when 
    # rendering the output prime multiplications table.
    # A bigger value will be used, if the maximum multiplicatin product
    # exceeds this value.
    MIN_CELL_WIDTH = 5
    # The number of white space characters to be used as padding on the
    # left side of each table cell
    MIN_CELL_LEFT_PADDING = 1
end

FCPrimesMultiplicationTableLib::CLI.run