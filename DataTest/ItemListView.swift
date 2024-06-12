//
//  ItemListView.swift
//  DataTest
//
//  Created by Scott Jann on 6/12/24.
//

import SwiftUI

struct ItemListView: View {
	@ObservedObject var itemList: ItemList

	var body: some View {
		HStack {
			VStack(alignment: .leading) {
				Text(itemList.name)
			}

			Spacer()

			if itemList.isUpdating {
				ProgressView()
					.controlSize(.small)
			}
		}
	}
}
