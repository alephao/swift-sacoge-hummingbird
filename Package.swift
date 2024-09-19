// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "swift-sacoge-hummingbird",
  platforms: [.macOS(.v14), .iOS(.v17), .tvOS(.v17)],
  products: [
    .library(
      name: "SacogeHummingbird",
      targets: ["SacogeHummingbird"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/hummingbird-project/hummingbird.git", from: "2.0.0"),
    .package(url: "https://github.com/apple/swift-log.git", from: "1.4.0"),
    .package(url: "https://github.com/apple/swift-nio.git", from: "2.63.0"),
  ],
  targets: [
    .target(
      name: "SacogeHummingbird",
      dependencies: [
        .product(name: "Hummingbird", package: "hummingbird"),
        .product(name: "Logging", package: "swift-log"),
        .product(name: "NIOPosix", package: "swift-nio"),
      ],
      swiftSettings: [
        .enableExperimentalFeature("StrictConcurrency=complete")
      ]
    )
  ]
)
