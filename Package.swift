// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "1.6.0"
let checksum = "ecf700ce3fac8749d76a926bab9e93c0e96fc64d0c8816b3855e21e614955779"


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
