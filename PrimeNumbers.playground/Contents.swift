/*:
 ## Solution Method
 
 - Create a function using [Wilson's Theorem] (https://brilliant.org/wiki/wilsons-theorem/)
 - Call the function and pass in variable to be evaluated
 
 ## Psuedocode
 
 CheckPrime(int n) -> Boolean
 {
    if (n−1)! ≡−1(modn) (n-1)! \equiv -1 \pmod {n} (n−1)!≡−1(mod n).  (https://brilliant.org/wiki/wilsons-theorem/)
    {
        return True
    }
 }
 
 CheckPrime(numberInput)
 */

import UIKit

//function taken from https://stackoverflow.com/questions/33666197/how-to-calculate-the-21-21-factorial-in-swift
func factorial(_ n: Int) -> Int
{
    var total = 0
    for i in 0...n
    {
        total += i
    }
    return total
}

func CheckPrime(_ n: Int) -> Bool
{
    if (n < 1) //Needed to add these cases because I did not consider them while creating psuedocode
    {
        return false
    }
    
    if(n == 1)
    {
        return true
    }
    
    if (factorial(n-1) == (% n) -1)
    {
       return true
    }
    else
    {
        return false
    }
}



let cap : Int = 9

for i in 0...cap
{
    print("Is \(i) prime: \(CheckPrime(i))")
}

