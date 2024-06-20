// swift-tools-version:6.0
import PackageDescription

let package = Package(
	name: "ErgoAppKit",
	platforms: [
		.macOS(.v10_15)
	],
	products: [
		.library(
			name: "ErgoAppKit",
			targets: ["ErgoAppKit"]
		),
		.library(
			name: "ErgoAppKitTesting",
			targets: ["ErgoAppKitTesting"]
		)
	],
	dependencies: [
		.package(url: "https://github.com/Fleuronic/Ergo", branch: "main"),
		.package(url: "https://github.com/Fleuronic/workflow-swift", branch: "main")
	],
	targets: [
		.target(
			name: "ErgoAppKit",
			dependencies: [
				"Ergo",
				.product(name: "WorkflowMenuUI", package: "workflow-swift"),
			],
			swiftSettings: [.swiftLanguageVersion(.v6)]
		),
		.target(
			name: "ErgoAppKitTesting",
			dependencies: [
				"ErgoAppKit",
			]
		)
	]
)
