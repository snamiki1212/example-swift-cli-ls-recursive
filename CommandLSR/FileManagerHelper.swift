//
//  FileManagerHelper.swift
//  CommandLSR
//
//  Created by shunnamiki on 2021/07/28.
//

import Foundation

public func listContents(atPath: String) -> [String] {
    let fm = FileManager();
    let result = try! fm.contentsOfDirectory(atPath: atPath)
    return result
}

public func fileExists(atPath: String) -> (fileExists: Bool, isDir: Bool){
    let fm = FileManager();
    var isDir: ObjCBool = false
    let exits = fm.fileExists(atPath: atPath, isDirectory: &isDir);
    return (exits, isDir.boolValue);
}