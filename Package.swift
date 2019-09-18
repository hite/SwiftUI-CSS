// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUI_CSS",
    platforms: [
        // specify each minimum deployment requirement,
        //otherwise the platform default minimum is used.
        .macOS(.v10_15),.iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SwiftUI_CSS",
            targets: ["SwiftUI_CSS"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SwiftUI_CSS",
            dependencies: []),
        .testTarget(
            name: "SwiftUI_CSSTests",
            dependencies: ["SwiftUI_CSS"]),
    ]
)
