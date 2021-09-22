import UIKit
//import Foundation

/*:
 # The follow will make an invalid email:
 - More than or less than one @ symbol
 - No period
 - Period is not after the @ symbol
 - Email doesn't have a top level domain (like .com or .edu)
 - A space is present
 
 
 # Solution Method
 - Create a function which takes in a string
 - Convert the string to lowercase for easier parsing
 - Starts by validating that certain key characters are contained in the string
 - If '@' or '.' are not contained in the string, it is not a valid email, and so the function will return false to indicate that it's not valid
 - If it passes this test, the function will break the string down into several parts
 - Note: Later I needed to add additional validation for placement of the @ symbol as well as the period. This was done by splitting the string and then validating each side.
 
Additionally, I use the underscore "_" in functions to override the need to provide an external name
 */

func validateEmail(_ input: String) -> Bool
{
    
//    Make sure email contains a . symbols, or return false
    if input.contains(" ")
    {
        print("Error: Email may not have any spaces.")
        return false
    }
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
    //This is actually undeeded
    let lowerInput = input.lowercased()
    
    //Split email into first and second half so they can be parsed seperately
    //This code snippet is from https://stackoverflow.com/questions/25678373/split-a-string-into-an-array-in-swift
    let inputArray = lowerInput.components(separatedBy: "@") //An array to store the left and right half of the email
    let firstHalf = inputArray[0] //Left half of the email
    let lastHalf = inputArray[1] //Right half of the email
    
    //Verify that first half doesn't contain illegal character @
    if firstHalf.contains("@")
    {
        print("Error: Email can't contain more than one @.")
        return false
    }
   
    //Split last half further into domain and then .com
    if(!lastHalf.contains("."))
    {
        print("Error: There can't be a period after the @ symbol")
        return false
    }
    let lastHalfArray = lastHalf.components(separatedBy: ".")
    let domain = lastHalfArray[0] //The part of the email to the left of the domain
    let topLevelDomain = lastHalfArray[1] //The very ending fo the email
    
    //Verify that domain doesn't contain illegal character @
    if domain.contains("@")
    {
        print("Error: Email contains more than one @.")
        return false
    }
    //Email must have domain
    if domain == ""
    {
        print("Error: Email doesn't have a domain.")
        return false
    }
    
    //Verify that the email has a top level domain
    if topLevelDomain == ""
    {
        print("Error: Email doesn't contain a top level domain.")
        return false
    }

    print("Success. Thanks for the email \(firstHalf)!")
    return true
}

validateEmail("Test@em@il.com")
validateEmail("mail.com")
validateEmail("mail@.com")
validateEmail("MAIL@mail.")
validateEmail("MA.IL@mail")
validateEmail("cibrian@chapman.edu")
validateEmail("hipjasif@gmail.com")
validateEmail("thisisnot an email")
validateEmail("cibrien.edu")
validateEmail("cibrien@.edu")
validateEmail("juan.perez@compania.com.mx")
