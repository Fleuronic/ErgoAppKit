
import ViewEnvironment

import class WorkflowMenuUI.ScreenMenu

class ItemUpdatingMenu<View: MenuItemDisplaying>: ScreenMenu<View.Screen> {
	private let contentView: View

	// MARK: ScreenMenu
	required init(
		screen: View.Screen, 
		environment: ViewEnvironment
	) {
		contentView = .init(screen: screen)
		super.init(screen: screen, environment: environment)
	}
	
	override func screenDidChange(from previousScreen: View.Screen, previousEnvironment: ViewEnvironment) {
		super.screenDidChange(from: previousScreen, previousEnvironment: previousEnvironment)
		items = contentView.menuItems(with: screen)
	}
}
