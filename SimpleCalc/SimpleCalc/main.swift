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
                default: return 0
            }
        } else {
            let op = args[args.count - 1]
            let avgFunc = {(operation : [String]) -> Int in
                if operation.count == 0 {
                    return 0
                }
                var sum = 0;
                for index in 0..<operation.count {
                    sum += Int(operation[index])!
                }
                return sum/operation.count
            }
            
            let factFunc = {(operation : [String]) -> Int in
                var res = 0
                if operation.count == 1 {
                    res = 1
                    let num = Int(operation[0])!
                    for index in 1...num {
                        res *= index
                    }
                }
                return res
            }
            
            let numsArray = Array(args[0..<args.count - 1])
            switch op {
            case "count": return numsArray.count
            case "avg": return avgFunc(numsArray)
            case "fact": return factFunc(numsArray)
            default: return 0
            }
        }
    }
    
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

