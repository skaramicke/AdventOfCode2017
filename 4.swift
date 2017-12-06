let input = """
aa bb cc dd ee
aa bb cc dd aa
aa bb cc dd aaa
abcde fghij
abcde xyz ecdab
a ab abc abd abf abj
iiii oiii ooii oooi oooo
oiii ioii iioi iiio
"""

func validate(_ phrases:[[String]]) -> Int {
  return phrases.filter({ words in
    words.filter({ word in words.filter{ $0 == word }.count == 1 }).count == words.count
  }).count
}

let phrases = input.split{$0 == "\n"}.map{$0.split{$0 == " "}.map{String($0)}}

let count = validate(phrases)
let count2 = validate(phrases.map{ $0.map{ String($0.sorted()) } })

print("Day 4, task 1: \(count)")
print("Day 4, task 2: \(count2)")
