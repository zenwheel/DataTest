//
//  ItemView.swift
//  DataTest
//
//  Created by Scott Jann on 6/12/24.
//

import SwiftUI

struct ItemView: View {
	@Environment(NavigationModel.self) private var navigationModel
	@ObservedObject var itemList: ItemList

	var body: some View {
		@Bindable var navigationModel = navigationModel
		NavigationStack {
			ItemListContentView()
		}
		.navigationTitle(itemList.name)
		.toolbar {
			if itemList.isUpdating {
				ProgressView()
					.controlSize(.small)
			}
		}
	}
}
