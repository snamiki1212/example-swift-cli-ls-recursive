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
    doLsr(path);
}

private func doLsr(_ path: String, _ suffixForPrinter: String = "") {
    let (fileExits, isDir) = fileExists(atPath: path);
    
    // Base case
    if !fileExits { return }
    
    // Recursive case
    let contents = listContents(atPath: path)
    for (idx, content) in contents.enumerated() {
        let isLast = contents.count - 1 == idx
        
        // printer
        let thisSuffixChar = isLast ? SUFFIX_OF_END : SUFFIX_OF_CONTENT;
        let thisSuffix = suffixForPrinter + thisSuffixChar
        print(thisSuffix, content);
        
        // ls recursively
        if isDir {
            let nextSuffix = isLast
                ? SUFFIX_OF_PADDING + SUFFIX_OF_PADDING
                : SUFFIX_OF_MIDDLE + SUFFIX_OF_PADDING
            let nextSuffixForPrinter = suffixForPrinter + nextSuffix
            let nextPath = path + "/" + content
            doLsr(nextPath, nextSuffixForPrinter)
        }
        
    }
}

