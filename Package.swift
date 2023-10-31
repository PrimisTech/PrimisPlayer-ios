// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "2.3.1"
let checksum = "ff56f81aec206c2f1bde14f6338e4c4779c6525e5881309fbfde3d4f4a5acce6"


let package = Package(
    name: "PrimisPlayer",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "PrimisPlayer",
            targets: ["PrimisPlayer"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "PrimisPlayer",
            url:"https://github.com/PrimisTech/PrimisPlayer-ios/releases/download/\(version)/PrimisPlayer.xcframework.zip",
            checksum: checksum
        )
    ]
)
