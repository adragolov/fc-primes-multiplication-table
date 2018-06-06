module FCPrimesMultiplicationTableLib

    #
    # Module: MathServices
    #
    # Namespace for any mathematical ops within the library.
    # 
    # Some of these are over-engineered with the intent of demonstrating
    # complexity and opening up space for unit tests.
    #
    module MathServices
    
        # Determines the max value for an array of numerics and returns it squared.
        # Used to determine the biggest number to be displayed in the output grid
        # Throws argument error if 
        #  - input argument is not an array.
        #  - array is empty
        #  - elements of the array are not numerics
        def self.getMaxValueSquared!(arr)

            raise ArgumentError.new("Array argument expected.")  unless arr.is_a? Array
            raise ArgumentError.new("Array argument #{arr} is empty.")  if arr.empty?
            raise ArgumentError.new("One or more elements of the array is non-numeric.") unless self.canMultiplyArgs?(arr)

            maxElement = arr.max
            maxElement ** 2
        end

        # Multiplies a dynamic set of arguments.
        # Does not enforce argument type checking.
        def self.multiplyArgs(*numbers)

            numbers.inject do 
                |p, n| p * n.to_i 
            end
        end

        # Multiples a dynamic set of arguments. 
        # Enforces argument type checking, expects enumerable with numerics.
        # Throws argument error when the argument is invalid.
        def self.multiplyArgs!(*numbers) 
            
            unless self.canMultiplyArgs?(numbers)
                raise ArgumentError.new("Arguments cannot be multiplied.") 
            end

            self.multiplyArgs(numbers)
        end

        # Verifies if a dynamic set of arguments may be used for multiplication,
        # e.g. every argument represents a numeric value
        def self.canMultiplyArgs?(*numbers)
            
            for arg in numbers
                if arg.is_a? Array
                    return false if arg.empty?
                    return false unless self.canMultiplyArgs? *arg #recurse
                else
                    return false unless arg.is_a? Numeric
                end
            end

            true # all child enumerables are valid
        end
    end
end