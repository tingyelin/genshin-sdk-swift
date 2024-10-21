// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GenshinSDK",
    products: [
        .library(
            name: "GenshinSDK",
            targets: ["GenshinSDK"]),
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher", from: "8.0.0")
    ],
    targets: [
        .target(
            name: "GenshinSDK"),
        .testTarget(
            name: "GenshinSDKTests",
            dependencies: ["GenshinSDK"]),
    ]
)
