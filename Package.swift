// 19/10/2016 Unfortunately it does not work at the moment as Alamofire is not ready to compile on OSX.
// See issue https://github.com/Alamofire/Alamofire/issues/1544

import PackageDescription

let package = Package(
    name: "DarkSkyKit",
    dependencies: [
        .Package(url: "https://github.com/Alamofire/Alamofire.git", majorVersion: 4)
    ],
    exclude: ["Makefile", "Package-Builder", "Carthage", "build", "Pods", "Tests", "assets", "fastlane", "Example"]

)
