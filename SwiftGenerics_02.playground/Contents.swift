import UIKit

// MARK: - Задача 2
//Реализовать базовый протокол для контейнеров. Контейнеры должны отвечать, сколько они содержат элементов, добавлять новые элементы и возвращать элемент по индексу. На основе базового протокола реализовать универсальный связанный список и универсальную очередь (FIFO) в виде структуры или класса.

protocol Container {
    associatedtype Item
    var count: Int { get }
    mutating func append(_ item: Item)
    subscript(i: Int) -> Item? { get }
}

class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode<T>?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T>: Container {
    typealias Item = T
    typealias Node = LinkedListNode<T>

    
    private var head: Node? = nil
    
    public init() {}
    
    public var first: Node? {
        return head
    }
    public var last: Node? {
        guard var node = head else {
            return nil
        }
        while let next = node.next {
            node = next
        }
        return node
    }
    
    public func append(_ item: T) {
        let newNode = LinkedListNode(value: item)
        if let lastNode = last {
            lastNode.next = newNode
            newNode.next = nil
        } else {
            head = newNode
        }
    }
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var count: Int {
        guard var node = head else {
            return 0
        }
        var count = 1
        while let next = node.next {
            count += 1
            node = next
        }
        return count
    }
    
    public func node(_ i: Int) -> Node? {
        if i == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<i {
                node = node?.next
                if node == nil { //(*1)
                    break
                }
            }
            return node!
        }
    }
    
    public subscript(i: Int) -> Item? {
        return node(i)!.value
    }
    
    public func removeAll() {
        head = nil
    }
    
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        var str = "["
        var node = head
        while node != nil {
            str += "\(node!.value)"
            node = node?.next
            if node != nil {
                str += ", "
            }
        }
        str += "]"
        return str
    }
}

var lstInt = LinkedList<Int>()
lstInt.isEmpty
lstInt.count
lstInt.append(1)
lstInt.append(2)
lstInt.append(3)

lstInt.first!.value
lstInt.last!.value
lstInt.isEmpty
lstInt.count

lstInt[0]
lstInt[1]
lstInt[2]

print(lstInt)

lstInt.removeAll()


var lstString = LinkedList<String>()
lstString.isEmpty
lstString.count
lstString.append("a")
lstString.append("b")
lstString.append("c")

lstString.first!.value
lstString.last!.value
lstString.isEmpty
lstString.count

lstString[0]
lstString[1]
lstString[2]

print(lstString)

lstString.removeAll()


class Queue<T>: Container {
    
    typealias Item = T
    public var array = [T]()
    
    
    public var count: Int {
        return array.count
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public func enqueue(_ elem: T) {
        array.append(elem)
    }
    
    public func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    public func append(_ item: T) {
        enqueue(item)
    }
    
    public subscript(i: Int) -> T? {
        return array[i]
    }
    
}

extension Queue: CustomStringConvertible {
    var description: String {
        var str = "["
        let length = array.count
        for i in 0..<length {
            str += "\(array[i])"
            if i != length - 1 {
                str += ", "
            }
        }
        str += "]"
        return str
    }
}

var queueInt = Queue<Int>()
queueInt.enqueue(1)
queueInt.enqueue(2)
queueInt.enqueue(3)

queueInt[0]
queueInt[1]
queueInt[2]

print(queueInt.count)
print(queueInt)

queueInt.dequeue()

print(queueInt)
print(queueInt.count)

queueInt.dequeue()
queueInt.dequeue()
print(queueInt.count)
