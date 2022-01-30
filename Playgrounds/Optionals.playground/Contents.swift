import UIKit

var myName : String?

myName?.uppercased()

//optionals : ? vs !

var myAge = "5"

var myInt = (Int(myAge) ?? 0) * 5

if let myNum = Int(myAge) {
    print(myNum * 5)
} else {
    print("wrong input")
}
