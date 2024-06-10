// Copyright © Fleuronic LLC. All rights reserved.

import AppKit
import WorkflowMenuUI
import ViewEnvironment

class ItemUpdatingMenu<View: MenuItemDisplaying>: ScreenMenu<View.Screen> {
	private let contentView: View

	// MARK: ScreenMenu
	required init(
		screen: View.Screen, 
		environment: ViewEnvironment
	) {
		contentView = .init(screen: screen)
		super.init(screen: screen, environment: environment)
		delegate = contentView
	}
	
	override func screenDidChange(from previousScreen: View.Screen, previousEnvironment: ViewEnvironment) {
		update(with: contentView.menuItems(with: screen))
	}
}

// MARK: -
public extension NSMenu {
	func update(with items: [NSMenuItem]) {
		let difference = items.difference(from: self.items)
		for case let .remove(index, _, _) in difference.removals { removeItem(at: index) }
		for case let .insert(index, item, _) in difference.insertions { insertItem(item, at: index) }
	}
}
