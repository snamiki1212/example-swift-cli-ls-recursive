# Overview

CLI `ls -R` with Swift.

https://user-images.githubusercontent.com/26793088/127398754-bc960eac-caf0-422a-a4de-87f5c6d61c55.mov

## How to compile

```zsh
$ xcrun -sdk macosx \
  swiftc \
    CommandLSR/main.swift \
    CommandLSR/lsr.swift \
    CommandLSR/FileManagerHelper.swift \
  -o lsr
$ ls lsr
lsr
```

## Usage

Note that need to compile before doing usage.

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
│   ├─ COMMIT_EDITMSG
│   └─ FETCH_HEAD
└─ lsr
93 directories, 116 files
```

## LICENSE

MIT
