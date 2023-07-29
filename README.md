# KeychainHelper

## Installation

### Swift Package Manager

1. File > Swift Packages > Add Package Dependency
2. Add `https://github.com/InstaRobot/KeychainHelper.git`

_OR_

Update `dependencies` in `Package.swift`

```swift

dependencies: [
    .package(url: "https://github.com/InstaRobot/KeychainHelper.git", .upToNextMajor(from: "1.0.0"))
]

```

## Usage

```swift

// import helper
import KeychainHelper

// example data
struct UserInfo: Codable {
    let userId: UUID
}

// create object
try KeychainHelper(keychainKey: "someKey", synchronizable: true).createSyncInfo(for: UserInfo(userId: UUID()))

// fetch object
let user: UserInfo? = try KeychainHelper(keychainKey: "someKey", synchronizable: true).fetchSyncInfo()

```
