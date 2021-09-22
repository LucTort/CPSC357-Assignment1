import UIKit
//import Foundation

/*:
 # Solution Method
 
 ##The follow will make an invalid email:
 - More than or less than one @ symbol
 - No period
 - Period is not after the @ symbol
 - Email doesn't have a top level domain (like .com or .edu)
 
 
 
 - Create a function which takes in a string
 - Convert the string to lowercase for easier parsing
 - Starts by validating that certain key characters are contained in the string
 - If '@' or '.' are not contained in the string, it is not a valid email, and so the function will return false to indicate that it's not valid
 - If it passes this test, the function will break the string down into several parts
 
 */

func validateEmail(_ input: String) -> Bool
{
//    Make sure email contains a . symbols, or return false
    if !input.contains(".")
    {
        print("Error: Email doesn't have a period.")
        return false
    }
    
    //Make sure there is only one @ in the string, or return false
    //Code snippet from: https://reactgo.com/swift-count-string-occurences/
    let result =  input.components(separatedBy:"@")
    
    if( (result.count - 1) != 1)
    {
        print("Error: Email doesn't have one @ symbol")
        return false
    }
    
    //Covert to lowercase for easier parsing
    let lowerInput = input.lowercased()
    
    //Split email into first and second half
    //This code snippet is from https://stackoverflow.com/questions/25678373/split-a-string-into-an-array-in-swift
    let inputArray = lowerInput.components(separatedBy: "@")
    let firstHalf = inputArray[0]
    let lastHalf = inputArray[1]
    
    //Verify that first half doesn't contain illegal character @
    if firstHalf.contains("@")
    {
        print("Error: Email can't contain more than one @.")
        return false
    }
    
    //Split last half further into domain and then .com
    let lastHalfArray = lastHalf.components(separatedBy: ".")
    let domain = lastHalfArray[0]
    let topLevelDomain = lastHalfArray[1]
    
    //Verify that domain doesn't contain illegal character @
    if domain.contains("@")
    {
        print("Error: Email can't contain more than one @.")
        return false
    }
    //Email must have domain
    if domain == ""
    {
        print("Error: Email must have domain.")
        return false
    }
    
    //Verify that the email has a top level domain
    if topLevelDomain == ""
    {
        print("Error: Email must contain a top level domain.")
        return false
    }

    print("Success. Email is valid.")
    
    return true
}

print(validateEmail("Test@em@il.com"))
print(validateEmail("mail.com"))
print(validateEmail("mail@.com"))
print(validateEmail("MAIL@mail."))
print(validateEmail("MA.IL@mail"))
