// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
        name: "QueryStringEncoder",
        platforms: [
            .macOS(.v10_10),
            .iOS(.v8),
            .watchOS(.v2),
            .visionOS(.v1),
            .macCatalyst(.v13)
        ],
        products: [
            .library(
                    name: "QueryStringEncoder",
                    targets: ["QueryStringEncoder"]),
        ],
        targets: [
            .target(
                    name: "QueryStringEncoder"),
            .testTarget(
                    name: "QueryStringEncoderTests",
                    dependencies: ["QueryStringEncoder"]),
        ],
        swiftLanguageVersions: [.v5]
)
