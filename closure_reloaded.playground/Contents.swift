//: Playground - noun: a place where people can play

import UIKit

// assign to var or constant
let f = {(x: Int) -> Int
    in
    return x + 42}

f(9)
f(76)

// Closures in an array (or a dictionary, or a set, etc...)
let closures = [f,
    {(x:Int) -> Int in return x * 2},
    {x in return x - 8},
    {x in x * 2},
    {$0 * 42}]

for fn in closures {
    fn(42)
}

let deepThought = { (question:String) in return "The answer to \"\(question)\" is \(7 * 6)!" }

deepThought("how old are you")

//: Functions and closures: same old, same old

func foo(x: Int) -> Int {
    return 42 + x
}

let bar = {(x: Int) -> Int
    in
    42 + x
}

// create a few functions, add them to an array and call them
func curly(n: Int) -> Int {
    return n * n
}

func larry(x: Int) -> Int {
    return x * (x + 1)
}

func moe(m: Int) -> Int {
    return m * (m - 1) * (m - 2)
}

var storages = [curly, larry, moe]
storages.append(bar)

//: Typealias

typealias Integer = Int

let z: Integer = 42
let zz: Int = 42

// (Int) -> Int

typealias IntToInt = (Int) -> Int
typealias IntMaker = (Void) -> Int

//: Variable Capture at last!!!

func makeCounter() -> IntMaker {
    var n = 0
    
    // Functions within functions?
    // Yes we can
    func adder() -> Int {
        n = n + 1
        return n
    }
    return adder
}

let counter1 = makeCounter()
let counter2 = makeCounter()

counter1()
counter1()
counter1()

counter2()


