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
            // Products define the executables and libraries a package produces, making them visible to other packages.
            .library(
                    name: "QueryStringEncoder",
                    targets: ["QueryStringEncoder"]),
        ],
        targets: [
            // Targets are the basic building blocks of a package, defining a module or a test suite.
            // Targets can depend on other targets in this package and products from dependencies.
            .target(
                    name: "QueryStringEncoder"),
            .testTarget(
                    name: "QueryStringEncoderTests",
                    dependencies: ["QueryStringEncoder"]),
        ]
)
