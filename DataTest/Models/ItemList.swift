//
//  ItemList.swift
//  DataTest
//
//  Created by Scott Jann on 6/12/24.
//

import Foundation

@MainActor class ItemList: ObservableObject {
	@Published var isUpdating = false
	@Published private(set) var id = UUID().uuidString
	@Published private(set) var name = "unnamed"

	let dateFormatter = DateFormatter()

	init() async {
		dateFormatter.dateStyle = .short
		dateFormatter.timeStyle = .long
		await update()
	}

	private(set) var items = [Item]() {
		didSet {
			objectWillChange.send()
		}
	}

	@MainActor func update() async {
		guard isUpdating == false else {
			return
		}
		isUpdating = true
		defer { isUpdating = false }

		try? await Task.sleep(nanoseconds: 100_000_000)
		name = dateFormatter.string(from: Date())

		items.append(Item(id: UUID().uuidString, description: dateFormatter.string(from: Date())))
		objectWillChange.send()
	}
}
