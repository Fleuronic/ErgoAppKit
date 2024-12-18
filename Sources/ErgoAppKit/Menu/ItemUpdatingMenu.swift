// Copyright © Fleuronic LLC. All rights reserved.

#if swift(<5.9)
import AppKit
import WorkflowMenuUI
import ViewEnvironment
#else
public import AppKit
public import WorkflowMenuUI
public import ViewEnvironment
#endif

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
		guard self.items != items else { return }

		self.items = items
	}
}
