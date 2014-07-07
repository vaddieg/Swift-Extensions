//
//  MyClasses.swift
//  exercise
//
//  Created by vad on 12.06.14.
//  Copyright (c) 2014 vad. All rights reserved.
//

import Foundation

extension Array {
    func randomElement() -> Element {
        return self[Int(arc4random_uniform(UInt32(self.count)))]
    }

}

class Person {
    var name : String
    @lazy var cards = Array<Card>()
    
    weak var BFF : Person?
    //@lazy var friends = Array<Person>()
    
    var description : String {
        //return "Person: \(name) has \(cards.count) cards.\n Friends: \(friends.map({ $0.name }))"
        return "Person: \(name) has \(cards.count) cards.\n Friends: \(BFF?.name))"
    }
    
    func friendWith(buddy : Person) {
        BFF = buddy
        buddy.BFF = self
        //friends.append(buddy)
        //buddy.friends.append(self)
    }
    func unfriend(/*exbuddy : Person*/) {
        if BFF {BFF!.BFF = nil}
        BFF = nil
        //exbuddy?.BFF = nil
        //friends.removeAtIndex((friends as NSArray).indexOfObject(exbuddy))
        //exbuddy.friends.removeAtIndex((friends as NSArray).indexOfObject(self))
    }
    
    init(name : String) {
        self.name = name
    }
    
    convenience init() {
        let firstNames = ["John", "Anna", "Lisa", "Bill", "Jack", "Peter", "Maria", "Paul"]
        let secondNames = ["Paulson", "Annawile", "Williamson", "Jackson", "Peterson", "Johnson", "Smith", "Cooper"]
        self.init(name:firstNames.randomElement() + " " + secondNames.randomElement())
        
    }
    
    deinit {
//        for buddy in friends {
//            unfriend(buddy)
//        }
        println("<<<<< \(name) is dead.")
    }
}

class Card {
    unowned let holder : Person
    let holderName : String
    init(holder : Person) {
        self.holder = holder;
        holderName = holder.name
    }
    
    deinit {
        println("<<<<< Card of \(holderName) is destoyed.")
    }
}

protocol CardIssuer {
    func issueCardFor(person : Person) -> Card
}

class Bank : CardIssuer {
    func issueCardFor(person : Person) -> Card {
        let pop = Card(holder: person)
        person.cards.append(pop)
        return pop
    }
}