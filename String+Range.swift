//
//  String+Range.swift
//  exercise
//
//  Created by vad on 08.07.14.
//  Copyright (c) 2014 vad. All rights reserved.
//

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

func testStringExt() {
    var testString = "Quick brown 🐺fox jumps over the lazy dog"
    println("Animal:\(testString[12,4])") // Animal:🐺fox
    testString[12,4] = "orangutan🐒"
    println(testString) //Quick brown orangutan🐒 jumps over the lazy dog
    
    var range2 = testString.rangeOfString("0")
    println(range2)
    
    var smth : String = testString[range2]
    println(smth)
    
    var hren = testString[2,8]
    println(hren)
    
    testString[1,6]="---"
    println(testString)
}