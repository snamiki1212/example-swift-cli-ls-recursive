//
//  lsr.swift
//  CommandLSR
//
//  Created by shunnamiki on 2021/07/28.
//

import Foundation
// Command: ls -R

let SUFFIX_OF_CONTENT = "├─"
let SUFFIX_OF_MIDDLE  = "│ "
let SUFFIX_OF_END     = "└─"
let SUFFIX_OF_PADDING = "  "

func lsr(_ path: String){
    let (numOfDirs, numOfFiles) = doLsr(path);
    print("\(numOfDirs) directories, \(numOfFiles) files");
}

private func doLsr(_ path: String, _ suffixForPrinter: String = "") -> (numOfDirs: Int, numOfFiles: Int){
    let (fileExits, isDir) = existFile(atPath: path);
    
    // Guard
    if !fileExits { return (0, 0)}
    
    // Base case
    let isFile = !isDir
    if isFile { return (0, 1) }
    
    // Recursive case
    let contents = listContents(atPath: path)
    var thisSumOfDirs = 0;
    var thisSumOfFiles = 0;
    for (idx, content) in contents.enumerated() {
        let isLast = contents.count - 1 == idx
        
        // printer
        let thisSuffixChar = isLast ? SUFFIX_OF_END : SUFFIX_OF_CONTENT;
        let thisSuffix = suffixForPrinter + thisSuffixChar
        print(thisSuffix, content);
        
        // ls recursively
        let nextSuffix = isLast
            ? SUFFIX_OF_PADDING + SUFFIX_OF_PADDING
            : SUFFIX_OF_MIDDLE + SUFFIX_OF_PADDING
        let nextSuffixForPrinter = suffixForPrinter + nextSuffix
        let nextPath = path + "/" + content
        let result = doLsr(nextPath, nextSuffixForPrinter)
        
        // Count up nums
        let (sumOfDirs, sumfOfFiles) = result
        thisSumOfDirs += sumOfDirs + 1
        thisSumOfFiles += sumfOfFiles
    }
    
    return (thisSumOfDirs, thisSumOfFiles)
}

