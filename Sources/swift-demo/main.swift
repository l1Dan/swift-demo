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
debugPrint(computeSorceGreaterThanOrEqualTo60(scores: scores))

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
}

debugPrint([1, 4, 5, 6].map { $0 + 1 })