import UIKit

// MARK: - Задача 1 "Сделать так, чтобы закомментиррованный код работал"

protocol sumProtocol {
    static func +(lhs: Self, rhs: Self) -> Self
}

extension Double: sumProtocol {}

func sumTwoValues<T : sumProtocol>(_ a: T, _ b: T) -> T {
	let result = a + b
	return result
}

let a = 25.0
let b = 34.0

let resultDouble = sumTwoValues(a, b)
print(resultDouble)

extension String: sumProtocol {}

let c = "ABC"
let d = "DEF"

let resultString = sumTwoValues(c, d)
print(resultString)
