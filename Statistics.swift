//
//  BoardFoot.swift
//
//  Created by Layla Michel
//  Created on 2022-03-23
//  Version 1.0
//  Copyright (c) 2022 IMH. All rights reserved.
//
//  This program asks the user for the width and height of a board
// and displays what the length should be in order to get a board
// foot (144 inches^3).
import Foundation

// Create two empty arrays
var arrayString: [String] = []
var arrayNums: [Double] = []

// Creating function to calculate the average of the array.
func calcMean(array: [Double]) -> Double {
    var sum = 0.0

    // Get the sum of all elements of the array
    for numbers in array {
        sum += numbers
    }

    // Calculate the average
    let average = sum / Double(array.count)
    return average
}

func calcMedian(array: [Double]) -> Double {
    // Sorts array from smallest to largest number
    var arraySort = array.sorted()

    // Number at the middle of the array
    let middle = arraySort.count/2
    var median = 0.0

    // Find the median
    if array.count % 2 == 0 {
        median = (arraySort[middle] + arraySort[middle - 1])/2
    } else {
        median = arraySort[middle]
    }

    return median
}

func calcMode(array: [Int]) -> [Int] {
    var counts = [Int: Int]()

    // Find the mode/number that appears the most
    array.forEach { counts[$0] = (counts[$0] ?? 0) + 1}
    let (_, count) = counts.max(by: {$0.1 < $1.1}) ?? (0, 0)
    var modes = counts.compactMap { $1 == count ? $0 : nil}

    // Sort from smallest to largest number
    modes.sort()

    return modes
}

do {
    if CommandLine.argc < 2 {
        // Message if no file is inputted
        // Defaults to set1.txt
        print("Error: Text file needed. Processing set1.txt by default.\n")
        let path: String = "set1.txt"
        let set1 = try String(contentsOfFile: path)
        let arrayString: [String] = set1.components(separatedBy: "\n")
        arrayNums = arrayString.map { Double($0)!}

        // Display the array
        print(arrayString.map { Int($0)!})
        print("\n")

        let listMean = calcMean(array: arrayNums)
        print("The average is \(listMean)")

        let listMedian = calcMedian(array: arrayNums)
        print("The median is \(listMedian)")

        let listMode = calcMode(array: arrayNums.map { Int($0)})
        print("The mode is \(listMode)")
    } else {
        // Read command line arguments for file name
        let arguments = CommandLine.arguments
        let path: String = arguments[1]

        let set1 = try String(contentsOfFile: path)
        let arrayString: [String] = set1.components(separatedBy: "\n")
        arrayNums = arrayString.map { Double($0)!}

        // Display the array
        print(arrayString.map { Int($0)!})
        print("\n")

        let listMean = calcMean(array: arrayNums)
        print("The average is \(listMean)")

        let listMedian = calcMedian(array: arrayNums)
        print("The median is \(listMedian)")

        let listMode = calcMode(array: arrayNums.map { Int($0)})
        print("The mode is \(listMode)")
    }
} catch {
    // Error message if nonexistent file is inputted
    Swift.print("File does not exist.")
}
