// Copyright © Fleuronic LLC. All rights reserved.

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
		super.screenDidChange(from: previousScreen, previousEnvironment: previousEnvironment)

		if contentView.shouldUpdateItems(with: screen, from: previousScreen) {
			items = contentView.menuItems(with: screen)
		}
	}
}
