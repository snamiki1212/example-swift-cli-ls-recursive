# Overview

CLI `ls -R` with Swift.

https://user-images.githubusercontent.com/26793088/127398754-bc960eac-caf0-422a-a4de-87f5c6d61c55.mov

## Compile

```zsh
# 1. Before compiling, code should be gathered in main file.

# 2. Compile
$ xcrun -sdk macosx swiftc CommandLSR/main.swift -o lsr

# 3. run
# lsr <path>
$ ./lsr .
├─ swift-ls-command
├─ CommandLSR.xcodeproj
│   ├─ project.pbxproj
│   ├─ xcuserdata
│   │   └─ shun.xcuserdatad
│   │       └─ xcschemes
│   │           └─ xcschememanagement.plist
...

```

## LICENSE

MIT
