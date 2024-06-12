//
//  Item.swift
//  DataTest
//
//  Created by Scott Jann on 6/12/24.
//

import Foundation

class Item: ObservableObject, Codable, Identifiable, Equatable {
	static func == (lhs: Item, rhs: Item) -> Bool {
		return lhs.id == rhs.id &&
		lhs.description == rhs.description
	}

	@Published var id: String
	@Published var description: String
	init(id: String,
		 description: String) {
		self.id = id
		self.description = description

	}

	enum CodingKeys: String, CodingKey {
		case id
		case description
	}

	required init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		id = try container.decode(String.self, forKey: .id)
		description = try container.decode(String.self, forKey: .description)
	}

	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(id, forKey: .id)
		try container.encode(description, forKey: .description)
	}
}
