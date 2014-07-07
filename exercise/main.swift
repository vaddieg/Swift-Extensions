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

testStringExt()






//var range = String.Index(0)..String.Index(3)
//println(range)



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