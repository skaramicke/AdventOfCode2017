let input = """
91212129
"""


func solve(_ input:String) -> Int {
  var output = 0
  for i in 0..<input.count {
    let value = String(input[i])
    let otherValue = String(input[(i + 1) % input.count])
    output += value = otherValue ? Int(value) : 0
  }
  return output
}

let result = solve(input)
print("Day 1, part 1: \(result)")
