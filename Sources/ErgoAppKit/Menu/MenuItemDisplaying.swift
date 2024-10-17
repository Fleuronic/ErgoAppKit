// Copyright © Fleuronic LLC. All rights reserved.

#if swift(<5.9)
import AppKit
import WorkflowMenuUI
#else
public import AppKit
public import WorkflowMenuUI
#endif

public protocol MenuItemDisplaying: NSMenuDelegate {
	associatedtype Screen: WorkflowMenuUI.Screen
	
	init(screen: Screen)

	func menuItems(with screen: Screen) -> [NSMenuItem]
}
