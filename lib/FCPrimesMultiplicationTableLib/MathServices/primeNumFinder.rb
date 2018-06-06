module FCPrimesMultiplicationTableLib
    
    module MathServices

        #
        # Class that capsulates an algorithm for finding prime numbers.
        #
        class PrimeNumFinder

            public 
            
            def getPrimesUntil(n)

            end

            def getFirstNPrimes(n)
                
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