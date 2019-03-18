import UIKit

// MARK: - Задача 3*. К выполнению необязательна. 

enum List<T> {
    indirect case Node(T, _ next: List<T>)
    case End
}

extension List {
    
    func cons(_ x: T) -> List {
        return .Node(x, self)
    }
    mutating func push(x: T) {
        self = self.cons(x)
    }
    mutating func pop() -> T? {
        switch self {
        case let .Node(x, next):
            self = next
            return x
        case .End:
            return nil
        }
    }
//    var count: Int {
//        switch self {
//        case let .Node(_, next):
//            var count = 1
//            if next = next {
//                count += next.count
//            }
//            return count
//        case .End:
//            return 0
//        }
//
//    }
//    var isEmpty: Bool {
//        return self == .End
//    }
    
}

//extension List: CustomStringConvertible {
//    var description: String {
//        var str = "["
//        switch self {
//        case let .Node(x, next):
//            str += "\(x)"
//            if next != nil {
//                str += ", "
//                next?.description ?? ""
//            }
//            str = "]"
//            return str
//        case .End:
//            return ""
//        }
//
//    }
//}

var stack = List<Int>.End.cons(1).cons(2).cons(3)
stack.push(x: 4)
stack.pop()
stack.pop()
