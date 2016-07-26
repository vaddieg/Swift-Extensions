//
//  main.swift
//  exercise
//
//  Created by vad on 04.06.14.
//  Copyright (c) 2014 vad. All rights reserved.
//

import Foundation


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


// linked list test

let eq = "Lorem ipsum dolor 54 at vino ovo veratis"
let list = LinkedList<String>(array: eq.componentsSeparatedByString(" "));

let list1 = LinkedList<String>()
list1.append("wordl")
list1.append("hello")
list1.insert("say")
list1.insert("funking",at: 2)

let el1 = list1.insert("take1", after: list1.tail)
let el2 = list1.insert("take2", after: el1)
list1.insert("take3", after: el1)

list1.reverse()
var out = ""
for s in list1 {
    out+=s+" "
}
print(out)


list.reverse()

let mapped = list.map { $0.uppercaseString
}

list.head?.value
list.tail?.value



for s in mapped {
    out = out + s
}

print(out)


print("Hello, World!")

