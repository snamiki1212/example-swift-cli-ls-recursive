//
//  lsr.swift
//  CommandLSR
//
//  Created by shunnamiki on 2021/07/28.
//

import Foundation
// Command: ls -R

let SUFFIX_OF_CONTENT = "├─"
let SUFFIX_OF_PADDING = "│ "
let SUFFIX_OF_END = "└─"

func lsr(_ path: String){
    let r1 = fileExists(atPath: path);
    let r2 = listContents(atPath: path)
    print(">1", r1);
    print(">2", r2);
}

