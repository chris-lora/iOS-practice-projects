import UIKit

func myFunction(){
    print("my function")
}
myFunction()

//input output return

func sumFunction(x: Int, y: Int) -> Int {
    return x + y
}

sumFunction(x: 1, y: 20)

let myFunctionVar = sumFunction(x: 10, y: 20)
print(myFunctionVar)

func logicFunc(a: Int, b: Int) -> Bool {
    if a > b {
        return true
    } else {
        return false
    }
}
logicFunc(a: 10, b: 50)
