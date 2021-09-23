/*:
 ## Solution Method
 
 - Create a function using [Wilson's Theorem](https://brilliant.org/wiki/wilsons-theorem/)
 - Call the function and pass in variable to be evaluated
 - Note: This solution ended up being less efficient than the naive solution because the factorials get so large.
 
 ## Psuedocode
 
 
 
 CheckPrime(int n) -> Boolean\
 {\
 //The following code turned out to be incorrect, because I was reading the math equation incorrectly. The actual solution if statement is: (factorial(n - 1) + 1) % n) == 0\
    if (n−1)! ≡−1(modn) (n-1)! \equiv -1 \pmod {n} (n−1)!≡−1(mod n).  (https://brilliant.org/wiki/wilsons-theorem/)\
    {\
        return True\
    }\
 }
 
 CheckPrime(numberInput)
 
 - Note: This only goes up to 21 because the factorial for the computation gets very large very quickly. I used 64 bit usigned integers for the data type, but even that is not enough to contain the factorials.
 
## Because the prime number checking can only go up to 21 with the above method, I added another solution
 
### Alternative Solution
 - Take in a number to check
 - Check that number for a base case (ie: negative numbers, 0, 1, 2)
 - Take that number and modulus it against all the number which precede it besides 1
 - If any of the modulus's are 0, then it's not prime, and we return false
 - Otherwise, return true
 
 Please note I use the underscore "_" in functions to override the need to provide an external name
 */

import UIKit

//function taken from https://stackoverflow.com/questions/33666197/how-to-calculate-the-21-21-factorial-in-swift
//I use an unsigned int so that it doesn't try to calcualte a negative factorial
func factorial(_ n: UInt) -> UInt64 //I use the unsigned 64 bit int because factorials get large quickly
{
    if(n == 0)
    {
        return 1
    }
        
    var total : UInt64 = 1
    for i in 1...n //I chose to use a for loop becuase it was best to loop a predetermined number of times while providing an incrementing value
    {
        total *= UInt64(i)
    }
    return total
}

//Additional help from Christopher Chang to figure out the math notation
//Uses Wilson's Theorem: https://en.wikipedia.org/wiki/Wilson%27s_theorem
func CheckPrime(_ n: Int) -> Bool
{
    if( (factorial(UInt(n - 1)) + UInt64(1)) % UInt64(n)) == UInt64(0)
    {
        return true
    }
    else
    {
        return false
    }
}

func CheckPrimeNaive(_ n: Int) -> Bool
{
    if(n < 0)
    {
        print("Negatives can't be prime")
        return false
    }
    //Establish base case
    if(n < 4)
    {
        return true
    }
    for i : Int in 2...(n/2)
    {
        if((n % i) == 0)
        {
            return false
        }
    }
    return true
}


//Using a constant here to save memory
//This only goes up to 21 before it breaks. I think this is because the factorial numbers to too large after that point.
let cap : Int = 21 //The maximum factorial to be calculated

print("Math Intensive Solutions:\n")

for i : Int in 1...cap //I chose to use a for loop becuase it was best to loop a predetermined number of times while providing an incrementing value
{
    print("Is \(i) prime: \(CheckPrime(i))")
}


let highCap : Int = 200

print("\nNaive solutions:\n")

for i : Int in 1...highCap //I chose to use a for loop becuase it was best to loop a predetermined number of times while providing an incrementing value
{
    print("Is \(i) prime: \(CheckPrimeNaive(i))")
}

