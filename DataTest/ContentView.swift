//
//  ContentView.swift
//  DataTest
//
//  Created by Scott Jann on 6/12/24.
//

import SwiftUI

struct ContentView: View {
	@Environment(NavigationModel.self) private var navigationModel
	@State private var columnVisibility = NavigationSplitViewVisibility.automatic

	var body: some View {
		@Bindable var navigationModel = navigationModel
		NavigationSplitView(columnVisibility: $columnVisibility) {
			ZStack {
				if navigationModel.itemLists.count == 0 {
					Text("No Lists")
				} else {
					List(selection: $navigationModel.selectedItemListId) {
						ForEach(navigationModel.itemLists, id: \.id) { itemList in
							ItemListView(itemList: itemList)
						}
					}
					.navigationTitle("Item Lists")
				}
			}
			.listStyle(SidebarListStyle())
			.frame(minWidth: 240)
			.toolbar {
				Button(action: {
					Task {
						navigationModel.itemLists.append(await ItemList())
					}
				}) {
					Image(systemName: "rectangle.stack.badge.plus")
				}

				Button(action: {
					Task {
						await navigationModel.updateAllItemLists()
					}
				}) {
					Image(systemName: "arrow.clockwise")
				}
			}
		} detail: {
			if navigationModel.itemLists.count == 0 {
				Text("No Lists")
			} else {
				if let selectedItemList = navigationModel.selectedItemList {
						ItemView(itemList: selectedItemList)
				} else {
					Text("No List Selected")
				}
			}
		}
    }
}

#Preview {
    ContentView()
}
