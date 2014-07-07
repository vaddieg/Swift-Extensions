//
//  main.swift
//  exercise
//
//  Created by vad on 04.06.14.
//  Copyright (c) 2014 vad. All rights reserved.
//

import Foundation
//import MyClasses

extension String {
    var firstLetter : String {
        let range = Range(start: 0, end: 1)
        return (self as NSString).substringToIndex(1)
    }
    func uppercase() -> String { return self.uppercaseString }
    mutating func doSomethingWith(str : String, arg2: Int) -> String {
        self = String("\(self)\(str) - \(arg2)")
        return self
    }
}

extension String {
    subscript (startIndex : Int, count : Int) -> String {
        get { // substring with given range
            var ret = ""
            var counter = 0
            for character in self {
                if counter >= startIndex { ret+=character }
                if ++counter > startIndex + count - 1 { break }
            }
            return ret
        }
        mutating set { // replace characters in range
            var tmp = ""
            var counter = 0
            for character in self {
                if counter < startIndex || counter >= startIndex + count {
                    tmp+=character
                }
                else if counter == startIndex {
                    tmp+=newValue
                }
                counter++
            }
            self = tmp
        }
    }
}

var testString = "Quick brown 🐺fox jumps over the lazy dog"
println("Animal:\(testString[12,4])") // Animal:🐺fox
testString[12,4] = "orangutan🐒"
println(testString) //Quick brown orangutan🐒 jumps over the lazy dog



//var range = String.Index(0)..String.Index(3)
//println(range)

var range2 = testString.rangeOfString("0")

//var wtf = testString[subRange: range]

println(range2)

var smth : String = testString[range2]
println(smth)


//testString.doSomethingWith("999", arg2: 4)

var hren = testString[2,8]
println(hren)

testString[1,6]="---"
println(testString)

println("Hello, World!")

var dict = Dictionary<String, AnyObject>()//NSMutableDictionary()
var arr2 = Array<Int>()

arr2.insert(4, atIndex: 0)


let arr = ["baby","mom","dad"]

//let a = "adsf".uppercaseString
//
//let mapped = arr.map({ $0.uppercaseString })
//println(mapped)

dict["a"]=3


let dict2 : AnyObject! = dict//.copy()

dict["b"]=4
dict["fam"]=arr

println(dict)
println(dict2)

var date : AnyObject! = NSDate()

println(arr[0].firstLetter.uppercase())

var sampleString = "Look at this!"
sampleString.writeToFile("/Users/vad/1d.txt", atomically: true, encoding: NSUTF8StringEncoding, error: nil)

var item = ["name" : "John", "age" : 16]
var itemsArray = [["name" : "John", "age" : 16], ["name" : "Cathy", "age" : 16], ["name" : "Bill", "age" : 16]]

var names : AnyObject! = (itemsArray as NSArray).valueForKeyPath("name")

println(names)

var people = Array<Person>()

for i in 0..<1 {
    let aPerson = Person()
    if (i > 0) {
        aPerson.friendWith(people.randomElement())
    }
    people.append(aPerson)
    print(aPerson.description)
    println("---------------")
    
}

var guy : Person? = Person()
var boa = Bank()
boa.issueCardFor(guy!)

if (true) {
var guy2 = Person()
boa.issueCardFor(guy2)
guy2.friendWith(guy!)

println(guy!.description)
println(guy2.description)

println("---- MASS KILL STARTED ---")
guy = nil

println(guy2.description)
}

let a = names.count > 0 ? "full" : "empty"


//if (_,2)=~(1,2) {
//    println("match")
//}