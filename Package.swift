// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

var dependencies: [Package.Dependency] = [
    .package(url: "https://github.com/evgenyneu/keychain-swift.git", from: "20.0.0")
]

let package = Package(
    name: "KeychainHelper",
    products: [
        .library(
            name: "KeychainHelper",
            targets: ["KeychainHelper"]),
    ],
    dependencies: dependencies,
    targets: [
        .target(
            name: "KeychainHelper",
            dependencies: [
                .product(name: "KeychainSwift", package: "keychain-swift")
            ]
        ),
        .testTarget(
            name: "KeychainHelperTests",
            dependencies: ["KeychainHelper"]
        )
    ]
)
