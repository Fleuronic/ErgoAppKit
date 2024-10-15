// Copyright © Fleuronic LLC. All rights reserved.

public import AppKit
public import WorkflowMenuUI

public protocol MenuItemDisplaying: NSMenuDelegate {
	associatedtype Screen: WorkflowMenuUI.Screen
	
	init(screen: Screen)

	func menuItems(with screen: Screen) -> [NSMenuItem]
}
