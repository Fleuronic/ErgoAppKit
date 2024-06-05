// Copyright © Fleuronic LLC. All rights reserved.

import AppKit
import WorkflowMenuUI

public protocol MenuItemDisplaying: NSMenuDelegate {
	associatedtype Screen: WorkflowMenuUI.Screen
	
	init(screen: Screen)

	func menuItems(with screen: Screen) -> [NSMenuItem]
	func shouldUpdateItems(with screen: Screen, from previousScreen: Screen) -> Bool
}

public extension MenuItemDisplaying {
	func shouldUpdateItems(with screen: Screen, from previousScreen: Screen) -> Bool { true }
}
