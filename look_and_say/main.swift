//
//  main.swift
//  look_and_say
//
//  Created by Slave I on 9/15/22.
//

import Foundation

var terms = [[UInt8]]()
var term: [UInt8] = [1]
var nextTerm = [UInt8]()

var digit: UInt8
var currentChar: UInt8
var digitCount: UInt8 = 0
let max = 80

terms.append(term)

for i in 0..<(max-1) {
    if (i % 10 == 0) { print("i: \(i)") }
    digit = term[0]
    for j in 0..<term.count {
        currentChar = term[j]
        if (currentChar == digit) {
            digitCount += 1
        } else {
            nextTerm += [digitCount, digit]
            digit = currentChar
            digitCount = 1
        }
    }
    nextTerm += [digitCount, digit]
    terms.append(nextTerm)
    term = nextTerm
    nextTerm = [UInt8]()
    digitCount = 0
}

print("\n\n")
let message = terms.enumerated().map { (i, term) in
    return "\(i+1): \(term.count) digits"
}[0...(max-1)].joined(separator: "\n")

print(message)
