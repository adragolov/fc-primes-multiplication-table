module FCPrimesMultiplicationTableLib
    
    module MathServices

        #
        # Class that capsulates an algorithm for finding prime numbers.
        #
        class PrimeNumFinder

            # Retrieves an array with all prime numbers  until a given number 'n'.
            # Argument n<2 results in an empty array.
            def getPrimesUntil(n)

                return Array.new if n.to_i < 2
                
                result = (2..n.to_i).select do |v|
                    self.isPrime?(v)
                end
            end

            # Retrieves an array of the first n prime numbers
            # Argument n<2 results in an empty array.
            def getFirstNPrimes(n)
                
                results = Array.new
                nextPrime = 2
                normalized = n.to_i

                return results if normalized < 1
                
                results.push nextPrime

                # until we get enough results, compute next primes
                while results.length < normalized

                    nextPrime = self.getNextPrime(nextPrime)
                    results.push nextPrime
                end

                results
            end

            # Find the next prime number after a given argument
            # Brute-force, greedy, no smart sieves
            def getNextPrime(n)

                result = n.to_i+1
                result = result+1 until self.isPrime?(result)
                result   
            end 

            # Retrieves a boolean indication if a given argument is a prime number. 
            # Lookups range from 2 to square root of supplied argument
            def isPrime?(arg)
                
                normalized = arg.to_i
                return false if normalized <= 1

                (2..Math.sqrt(normalized).to_i).none? {
                    |i| return false if normalized % i == 0
                }

                true
            end
        end
    end
end