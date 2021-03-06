var input = """
5 9 2 8
9 4 7 3
3 8 6 5
"""

func solve(_ input:String) -> (Int, Int) {
  var sumDiffs = 0
  var sumDivisions = 0
  let lines = input.split(separator: "\n")
  for line in lines {
      let numbers = line.split(separator: " ")
      var smallest = 99999
      var biggest = 0
      for numberString in numbers {
          if let number = Int(String(numberString), radix: 10) {
              if number < smallest {
                  smallest = number
              }
              if number > biggest {
                  biggest = number
              }
              for otherNumberString in numbers {
                  if let otherNumber = Int(String(otherNumberString), radix: 10),
                      otherNumber != number,
                      number % otherNumber == 0 {
                      sumDivisions += number / otherNumber
                  }
              }

          }
      }
      sumDiffs += biggest - smallest
  }
  return (sumDiffs, sumDivisions)
}

let (sumDiffs, sumDivisions) = solve(input)

print("Day 2, task 1: \(sumDiffs)")
print("Day 2, task 1: \(sumDivisions)")
