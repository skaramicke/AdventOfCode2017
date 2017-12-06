
let input = """
0
3
0
1
-3
"""


func process(_ input:String, method:Int) -> Int {
  var steps = 0

  var list = input.split{$0 == "\n"}.map { Int($0)! }
  var currentIndex = 0
  while currentIndex >= 0 && currentIndex < list.count {
      let modification = list[currentIndex]
      if currentIndex >= 0 && currentIndex < list.count {
        list[currentIndex] += method == 1 ? 1 : (list[currentIndex] >= 3) ? -1 : 1
      }
      currentIndex += modification
      steps += 1
  }
  return steps
}

let result1 = process(input, method: 1)
print("Day 5, part 1: \(result1)")

let result2 = process(input, method: 2)
print("Day 5, part 1: \(result2)")
