// Copyright © Fleuronic LLC. All rights reserved.

import ViewEnvironment

import struct WorkflowMenuUI.MenuDescription
import class WorkflowMenuUI.ScreenMenu
import protocol WorkflowMenuUI.Screen

public protocol MenuBackingScreen: Screen where View.Screen == Self {
	associatedtype View: MenuItemDisplaying
	associatedtype Strings = String
}

// MARK: -
public extension MenuBackingScreen {
	typealias ScreenString = (Strings.Type) -> String

	// MARK: Screen
	func menuDescription(environment: ViewEnvironment) -> MenuDescription {
		.init(
			type: ItemUpdatingMenu<View>.self,
			build: { .init(screen: self, environment: environment) },
			update: { $0.update(screen: self, environment: environment) }
		)
	}
}
