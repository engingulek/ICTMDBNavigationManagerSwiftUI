// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ICTMDBNavigationManagerSwiftUI",
    platforms: [.iOS(.v26)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ICTMDBNavigationManagerSwiftUI",
            targets: ["ICTMDBNavigationManagerSwiftUI"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/engingulek/HPDependencyKit", from: "1.0.0"),
        .package(url: "https://github.com/engingulek/ICTMDBModularProtocols", branch: "version/swiftui")
    ],
    
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ICTMDBNavigationManagerSwiftUI",
            dependencies: [
                .product(name: "DependencyKit",package: "HPDependencyKit"),
                .product(name: "ICTMDBModularProtocols", package: "ICTMDBModularProtocols")
            ]
        ),

    ]
)
