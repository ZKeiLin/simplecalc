//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    
    public func calculate(_ args: [String]) -> Int {
        let operation = ["+", "-", "*", "/", "%"]
        if args.count < 1 {
            return 0
        }else if args.contains(where: operation.contains){
            let basicOp = args[1]
            let firstNum = Int(args[0])!
            let secondNum = Int(args[2])!
            switch basicOp {
                case "+": return firstNum + secondNum
                case "-": return firstNum - secondNum
                case "/": return firstNum / secondNum
                case "%": return firstNum % secondNum
                case "*": return firstNum * secondNum
                default:
                    print("can't recognize the expression")
                    return 0
            }
        } else {
            let op = args[args.count - 1]
            let numsArray = Array(args[0..<args.count - 1])
            switch op {
            case "count": return numsArray.count
            case "avg": return avgFunc(operation: numsArray)
            case "fact": return factFunc(operation: numsArray)
            default:
                print("can't recognize the expression")
                return 0
            }
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
    
    private func avgFunc (operation : [String]) -> Int{
        if operation.count == 0 {
            return 0
        }
        var sum = 0;
        for index in 0..<operation.count {
            sum += Int(operation[index])!
        }
        return sum/operation.count
    }
    
    private func factFunc (operation : [String]) -> Int{
        var res = 0
        if operation.count == 1 {
            res = 1
            let num = Int(operation[0])!
            if num < 0 {
                print("Factorial is for non-negative numbers only")
            }
            for index in 1...num {
                res *= index
            }
        }else{
            print("Unexpected input")
        }
        return res
    }
    
}


print("UW Calculator v1")
print("Enter an expression separated by returns:")

let first = readLine()!
let words = String(first.prefix(10))
if(words == "SimpleCalc"){
    let expression = String(first.dropFirst(11))
    print(Calculator().calculate("\(expression)"))
} else {
    let numCheck = Int(first)
    if numCheck != nil {
        let operation = readLine()!
        if operation == "+" || operation == "-" || operation == "/" || operation == "%" || operation == "*" {
            let second = readLine()!
            print(Calculator().calculate([first, operation, second]))
        } else {
            var next = operation
            var equation = first + " "
            while next != "count" && next != "avg" && next != "fact"{
                let numChecker = Int(next)
                if numChecker != nil{
                    equation = equation + " " + next
                }else{
                    print("Can't recognize Command!")
                }
                next = readLine()!
            }
            equation = equation + " " + next
            print(Calculator().calculate("\(equation)"))
        }
    }else{
        print("Can't recognize Command")
    }
}


