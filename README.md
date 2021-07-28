# Overview

CLI `ls -R` with Swift.

https://user-images.githubusercontent.com/26793088/127398754-bc960eac-caf0-422a-a4de-87f5c6d61c55.mov

## Usage

```zsh
# man: lsr <path>
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

## How to compile

```zsh
$ cd CommandLSR
$ xcrun -sdk macosx swiftc main.swift lsr.swift FileManagerHelper.swift -o ../lsr
$ cd ../
$ ls lsr
lsr
```

## LICENSE

MIT
