// Copyright © Fleuronic LLC. All rights reserved.

import class AppKit.NSMenuItem
import protocol WorkflowMenuUI.Screen

public protocol MenuItemDisplaying {
	associatedtype Screen: WorkflowMenuUI.Screen
	
	init(screen: Screen)
	
	func menuItems(with screen: Screen) -> [NSMenuItem]
}
