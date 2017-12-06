
let input = """
0 2 7 0
"""

var current = input.split(separator: " ").map({ Int($0)! })
var seen = [current]
let numberOfBanks = current.count

while true {

    let biggestValue = current.max()!
    let biggestIndex = current.index(of: biggestValue)!

    current[biggestIndex] = 0

    for i in 0..<biggestValue {
        let index = (biggestIndex + 1 + i) % numberOfBanks
        current[index] += 1
    }

    if let index = seen.index(where: { $0 == current }) {
      print("Day 6, part 1: \(seen.count)")
      print("Day 6, part 2: \(seen.count - index)")
      break
    }

    seen.append(current)
}
