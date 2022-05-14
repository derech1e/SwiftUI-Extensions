// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUI Extensions",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "SwiftUI Extensions",
            targets: ["SwiftUI Extensions"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftUI Extensions",
            dependencies: []),
    ]
)
