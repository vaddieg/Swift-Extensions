//
//  LinkedList.swift
//  exercise
//
//  Created by vad on 7/26/16.
//  Copyright © 2016 vad. All rights reserved.
//

import Foundation



class ListNode<Element> {
    var value : Element?
    var next : ListNode?
}

class LinkedList<Element> : SequenceType {
    
    var head : ListNode<Element>?
    weak var tail : ListNode<Element>?
    var isEmpty : Bool { return head == nil  }
    
    init () { }
    init (array: [Element]) {
        for i in 0..<array.count {
            let node = ListNode<Element>()
            node.value = array[i]
            if i==0 {
                head = node
                tail = node
            } else {
                tail!.next = node
            }
            tail = node
        }
    }
    
    func insert(el: Element, after: ListNode<Element>?) -> ListNode<Element> {
        let node = ListNode<Element>()
        node.value = el
        if after == nil {
            node.next = head
            head = node
        } else {
            node.next = after?.next
            after?.next = node
        }
        
        if node.next == nil {
            tail = node
        }
        
        return node
    }
    
    func insert(el: Element, at: Int = 0) {
        let node = ListNode<Element>()
        node.value = el
        
        if at == 0 {
            node.next = head
            head = node
        } else  { //skip N
            var current = head
            for _ in 0..<at-1 {
                current = current?.next
            }
            assert(current != nil, "Out of range")
            node.next = current!.next
            current!.next = node
        }
        
        if node.next == nil {
            tail = node
        }
    }
    
    func append(el : Element) {
        let node = ListNode<Element>()
        node.value = el
        if head == nil {
            head = node
        } else {
            tail?.next = node
        }
        tail = node
    }
    
    func reverse() {
        var newHead = head; newHead = nil
        var current = head
        newHead?.next = nil
        while current != nil {
            let next = current?.next
            current?.next = newHead
            newHead = current
            current = next
        }
        tail = head
        head = newHead
    }
    
    func generate() -> AnyGenerator<Element> {
        var current = head
        return AnyGenerator<Element> {
            if current != nil {
                let value = current!.value
                current = current!.next
                return value
            } else {
                return nil
            }
        }
    }
}
