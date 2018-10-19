// func map<Element, T>(_ array: [Element], transform: (Element) -> T) -> [T] {
//    var result: [T] = []
// ? 题1：给定一个整数数组 [1, 2, 3]，然后将数组中的每个元素乘以 2。
func numberElementMultipliedByTwo(integers: [Int]) -> [Int] {
    var result: [Int] = []
    for x in integers {
        result.append(x * 2)
    }
    return result
}

debugPrint(numberElementMultipliedByTwo(integers: [1, 2, 3]))

// ? 题2：给定一个整数数组 [1, 2, 3]，然后将数组中的每个元素加上 1。
func numberElementPlauOne(integers: [Int]) -> [Int] {
    var result: [Int] = []
    for x in integers {
        result.append(x + 1)
    }
    return result
}

debugPrint(numberElementPlauOne(integers: [1, 2, 3]))

func compute(_ array: [Int], transform: (Int) -> Int) -> [Int] {
    var result: [Int] = []
    for x in array {
        result.append(transform(x))
    }
    return result
}

// * 修改
func numberElementMultipliedByTwoV2(integers: [Int]) -> [Int] {
    return compute(integers) { $0 * 2 }
}

debugPrint(numberElementMultipliedByTwoV2(integers: [1, 2, 3]))

func numberElementPlauOneV2(integers: [Int]) -> [Int] {
    return compute(integers) { $0 + 1 }
}

debugPrint(numberElementPlauOneV2(integers: [1, 2, 3]))

func computeV2(array: [Int], transform: (Int) -> Bool) -> [Bool] {
    var result: [Bool] = []
    for x in array {
        result.append(transform(x))
    }
    return result
}

func generalCompute<Element, T>(_ array: [Element], transform: (Element) -> T) -> [T] {
    var result: [T] = []
    for x in array {
        result.append(transform(x))
    }
    return result
}

//! 思考1：给定一个整数数组 [1, 2, 3]，判断每一个元素是奇数还是偶数。
debugPrint(computeV2(array: [1, 2, 3]) { $0 % 2 == 0 })
//! 思考2：给定一个字符串数组 ["Swift", "C++", "Python"]，然后将数组中的每个元素拼接一个分号 “，”。
debugPrint(generalCompute(["Swift", "C++", "Python"]) { "\($0)," })

// ? 题3：给定一个整数数组 [59, 71, 95]，找出所有大于等于 60 分的。
func findScoreGreaterThanOrEqualTo60(scores: [Int]) -> [Int] {
    var result: [Int] = []
    for x in scores {
        if x >= 60 {
            result.append(x)
        }
    }
    return result
}

// ? 题4：给定一个字符串数组 [“C#”, "Swift", "C++", "Cat"]，找出所有 C 开头的元素。
func computeForInclude<Element>(_ array: [Element], isInclude: (Element) -> Bool) -> [Element] {
    var result: [Element] = []
    for x in array where isInclude(x) {
        result.append(x)
    }
    return result
}
debugPrint(computeForInclude([59, 71, 95], isInclude: { $0 >= 60 }))

//!  思考3：给定一个字符串数组 [“ABC”, "Alan", "Alpha", "Cat"]，找出所有包含 c 的元素。

// ? 题5：给定一个整数数组 [59, 71, 95]，求所有整数之和。
func sum(integers: [Int]) -> Int {
    var result: Int = 0
    for x in integers {
        result = result + x
    }
    return result
}
debugPrint(sum(integers: [1, 2, 3, 4]))

// ? 题6：给定一个字符串数组 [“C#”, "Swift", "C++", "Cat"]，连接所有字符串，用 - 分割。
func combine(strings: [String]) -> String {
    var result: String = ""
    for x in strings {
        result = "\(result) - " + x
    }
    return result
}
debugPrint(combine(strings: ["C#", "Swift", "C++", "Cat"]))

//! 思考4：给定一个字符串数组 [“C#”, "Swift", "C++", "Cat"]，连接所有字符串，并在开始处添加一个特定字符。
func computeForConcatenate<Element>(initial: Element, strings: [Element], combine: (Element, Element) -> Element) -> Element {
    var result = initial
    for x in strings {
        result = combine(result, x)
    }
    return result
}

debugPrint(computeForConcatenate(initial: 0, strings: [1, 2, 3, 4], combine: { $0 + $1 }))
// debugPrint(combine(strings: ["C#", "Swift", "C++", "Cat"]))

// TODO: - 扩展
extension Array {
    func genericCompute<T>(_ transform: (Element) -> T) -> [T] {
        var result: [T] = []
        for x in self {
            result.append(transform(x))
        }
        return result
    }

    func genericComputeForInclude(_ isInclude: (Element) -> Bool) -> [Element] {
        var result: [Element] = []
        for x in self where isInclude(x) {
            result.append(x)
        }
        return result
    }

    func genericComputeForConcatenate<Result>(_ initialResult: Result, nextPartialResult: (Result, Element) -> Result) -> Result {
        var result = initialResult
        for x in self {
            result = nextPartialResult(result, x)
        }
        return result
    }
}

// TODO: 扩展
extension Array {
    func map<T>(_ transform: (Element) -> T) -> [T] {
        var result: [T] = []
        for x in self {
            result.append(transform(x))
        }
        return result
    }

    func filter(_ isInclude: (Element) -> Bool) -> [Element] {
        var result: [Element] = []
        for x in self where isInclude(x) {
            result.append(x)
        }
        return result
    }

    func reduce<Result>(_ initialResult: Result, nextPartialResult: (Result, Element) -> Result) -> Result {
        var result = initialResult
        for x in self {
            result = nextPartialResult(result, x)
        }
        return result
    }
}

// ? 题7：给定一组分数[59, 72, 31, 96], 将分数大于等于 60 分的按照 Score： xx, 格式换行打印出来。
// let result = [59, 72, 31, 96].filter { $0 >= 60 }.map { "Score: \($0) " }.reduce("") { $0 + $1 }
// debugPrint(result)

// let some: Int? = 5
// debugPrint(some.map { x -> Int in
//     debugPrint("----")
//     return x
// })
// debugPrint(some.flatMap { $0 })
let array = [[1, 2, 3, 4, nil], [1, 3]]
print(array.genericCompute { $0 })
