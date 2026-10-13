// Copyright © Fleuronic LLC. All rights reserved.

public import AppKit
public import WorkflowMenuUI

@MainActor
public protocol MenuItemDisplaying: NSMenuDelegate, SendableMetatype {
	associatedtype Screen: WorkflowMenuUI.Screen

	init(screen: Screen)

	func menuItems(with screen: Screen) -> [NSMenuItem]
}
