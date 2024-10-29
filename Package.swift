// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "GenshinSDK",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "GenshinSDK",
            targets: ["GenshinSDK"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "GenshinSDK"),
        .testTarget(
            name: "GenshinSDKTests",
            dependencies: ["GenshinSDK"]),
    ]
)
