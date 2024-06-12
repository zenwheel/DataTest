//
//  ItemContentView.swift
//  DataTest
//
//  Created by Scott Jann on 6/12/24.
//

import SwiftUI

struct ItemContentView: View {
	@ObservedObject var item: Item

	init(item: Item) {
		self.item = item
	}

	var body: some View {
		VStack {
			Image(systemName: "list.dash.header.rectangle")
			Text(item.description)
		}
		.padding()
	}
}
