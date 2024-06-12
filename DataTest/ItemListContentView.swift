//
//  ItemListContentView.swift
//  DataTest
//
//  Created by Scott Jann on 6/12/24.
//

import SwiftUI

struct ItemListContentView: View {
	@Environment(NavigationModel.self) private var navigationModel
	@State private var currentItem: String? = nil
	@State private var alignment = UnitPoint.bottom
	@FocusState private var focusState: Bool
	
	var body: some View {
		if let selectedItemList = navigationModel.selectedItemList {
			if selectedItemList.items.count == 0 {
				VStack {
					Spacer()
					Text("This list is empty")
					Spacer()
				}
				.padding()
			} else {
				ScrollView(.vertical) {
					LazyVStack {
						ForEach(selectedItemList.items) { item in
							ItemContentView(item: item)
								.listRowSeparator(.hidden)
								.scrollTargetLayout()
								.id(item.id)
						}
						.onAppear {
							focusState = true
						}
						.onChange(of: currentItem) {
							alignment = .top
						}
					}
				}
				.scrollPosition(id: $currentItem, anchor: alignment)
				.safeAreaPadding()
				.focusable()
				.focusEffectDisabled()
				.focused($focusState)
			}
		} else {
			VStack {
				Spacer()
				Text("Select a list")
				Spacer()
			}
			.padding()
		}
	}
}

#Preview {
	ItemListContentView()
		.environment(NavigationModel())
}
