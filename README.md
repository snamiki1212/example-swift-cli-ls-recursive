# Overview

## Compile

```
# 1. Before compiling, code should be gathered in main file.
#   - refactor to gather code manually.

# 2. Compile
$ xcrun -sdk macosx swiftc CommandLSR/main.swift -o lsr

# 3. run
# lsr <path>
$ lsr /Users/shun/.ghq/ios/CommandLSR
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
