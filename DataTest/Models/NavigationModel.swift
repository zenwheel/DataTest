//
//  NavigationModel.swift
//  DataTest
//
//  Created by Scott Jann on 6/12/24.
//

import SwiftUI

// An observable object that manages the selection events for views.
@MainActor @Observable class NavigationModel {
	var itemLists = [ItemList]()

	var selectedItemListId: String? {
		didSet {
			ensureItemListSelection()
		}
	}

	var selectedItemList: ItemList?

	private func ensureItemListSelection() {
		selectedItemList = itemLists.first { itemList in itemList.id == selectedItemListId }
	}

	func updateAllItemLists() async {
		await withTaskGroup(of: Void.self) { group in
			for itemList in itemLists {
				group.addTask {
					await itemList.update()
				}
			}
		}
	}
}

