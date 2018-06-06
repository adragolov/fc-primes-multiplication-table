require_relative '../lib/FCPrimesMultiplicationTableLib/MathServices/mathServices'
require "test/unit"

module Tests 
    
    class MathServicesTests < Test::Unit::TestCase
        
        MATH_SERVICES = FCPrimesMultiplicationTableLib::MathServices

        # each sample is composed of numerics only with top limit of 10
        # expecting max value squared to be 100
        def testMaxValueSquared_default_use

            samples = [
                [0, 10, 8, 6, 1, 2, 4, 6],
                [10, 10, 10, 8],
                [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
                [10, 9],
                [10]
            ]

            samples.each {|arr| 
                puts "[testMaxValueSquared_default_use] Test with #{arr}"
                assert_equal(
                    MATH_SERVICES.getMaxValueSquared!(arr),
                    100
                )
            }
        end

        # each sample is expected to be faulty, e.g. is not an array, or empty array
        # or array that contains non-numeric characters
        def testMaxValueSquared_argument_error

            samples = [
                1,
                'a',
                [],
                ['a', 'b']
            ]

            samples.each{ |e| 
                assert_raises ArgumentError do
                    puts "[testMaxValueSquared_argument_error] Test with #{e}"
                    MATH_SERVICES.getMaxValueSquared! (e) 
                end
            }

            assert_raises ArgumentError do
                puts "[testMaxValueSquared_argument_error] Test with zero arguments"
                MATH_SERVICES.getMaxValueSquared!
            end
        end

        # tests the canMultiplyArgs method with positive expecation (truth)
        def testCanMultiplyArgs_positive

            positives = [
                [0, 10, 8, 6, 1, 2, 4, 6],
                [1, 2],
                [[1,2], [2, 3]],
            ]

            positives.each { |x| 
                puts "[testCanMultiplyArgs_positive] Positive test for #{x}"
                assert_true MATH_SERVICES.canMultiplyArgs? x 
            }
        end

        # tests the canMultiplyArgs method with faulty args for negative results 
        def testCanMultiplyArgs_negative

            negatives = [
                [0, '10', 8, 6, 1, 2, 4, 6],
                [1, '2'],
                [[1,2], ['2', 3]],
                []
            ]

            negatives.each { |x|
                puts "[testCanMultiplyArgs_negative] Negative test for #{x}"
                assert_false MATH_SERVICES.canMultiplyArgs? x
            }
        end
    end
end