module FCPrimesMultiplicationTableLib
    
    module MathServices

        class PrimeNumFinder

            public 
            
            def getPrimesUntil(n)

            end

            def getFirstNPrimes(n)
                
            end

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