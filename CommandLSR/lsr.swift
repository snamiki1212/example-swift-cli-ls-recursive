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
    // Guard
    let (fileExits, _) = getFileExistsAndIsDir(atPath: path);
    if !fileExits {
        print("Cannot find path(path: ", path, ")");
        return;
    }
    
    // run
    let (_numOfDirs, numOfFiles) = doLsr(path);
    let numOfDirs = _numOfDirs - 1 // decrement because number of top dir has to be removed
    print("\(numOfDirs) directories, \(numOfFiles) files");
}

private func doLsr(_ path: String, _ suffixForPrinter: String = "") -> (numOfDirs: Int, numOfFiles: Int){
    let (_, isDir) = getFileExistsAndIsDir(atPath: path);
    
    // Base case
    let isFile = !isDir
    if isFile { return (0, 1) }
    
    // Recursive case
    let contents = listContents(atPath: path)
    var thisSumOfDirs = 1; // increment num of this dir
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
        thisSumOfDirs += sumOfDirs
        thisSumOfFiles += sumfOfFiles
    }
    
    return (thisSumOfDirs, thisSumOfFiles)
}

