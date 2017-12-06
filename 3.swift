import Foundation

let input = 1024

func first(in cycle:Int) -> Int {
    return Int((pow(2 * Double(cycle) - 1, 2) + 1.0))
}

func length(of cycle:Int) -> Int {
    return cycle * 8
}

func cycle(of number:Int) -> Int {
    return Int(floor((sqrt(Double(number)-1.0) + 1.0) / 2.0))
}

enum Sectors:Int {
    case Right = 0
    case Up = 1
    case Left = 2
    case Down = 3
}

func sector(of number:Int) -> Sectors? {
    if number == 1 {
        return nil
    }
    return Sectors(rawValue: Int(floor(Double(4 * (number - first(in: cycle(of: number))) / length(of: cycle(of: number))))))
}

func position(of number:Int) -> (Int, Int) {
    if number == 1 {
        return (0, 0)
    }
    let c = cycle(of: number)
    if let sector = sector(of: number) {
        let offset = number - first(in: c) - sector.rawValue * length(of: c) / 4
        switch sector {
        case .Right:
            return (c, c - offset - 1)
        case .Left:
            return (-c, -c + offset + 1)
        case .Up:
            return (c - offset - 1, -c)
        case .Down:
            return (-c + offset + 1, c)
        }
    }
    return (0, 0)
}

func distance(to number:Int) -> Int {
    if number == 1 {
        return 0
    }
    let (x, y) = position(of: number)
    return abs(x) + abs(y)
}

print("Day 3, task 1: \(distance(to: input))")

var values:[Int: [Int: Int]] = [0: [0: 1]]
var lastPlottedNumber = 0
var number = 0
while lastPlottedNumber < input {
    number += 1
    let (x, y) = position(of: number)
    var surrounding = 0
    for xOffset in [-1, 0, 1] {
        for yOffset in [-1, 0, 1] {
            if let value = values[x + xOffset]?[y + yOffset] {
                surrounding += value
            }
        }
    }
    if values[x] == nil {
        values[x] = [:]
    }
    values[x]![y] = surrounding
    lastPlottedNumber = surrounding
}

print("Day 3, task 2: \(lastPlottedNumber)")
