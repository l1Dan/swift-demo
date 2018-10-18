let scores = [59, 31, 67, 95]

func computeSorceGreaterThanOrEqualTo60(scores: [Int]) -> [Int] {
    var result: [Int] = []
    for x in scores {
        if x >= 60 {
            result.append(x)
        }
    }
    return result
}

func sum(integers: [Int]) -> Int {
    return 0
}

extension Array {
    func map<T>(_ transform: (Element) -> (T)) -> [T] {
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
}

debugPrint([61, 34, 59, 96].filter { $0 >= 60})