//
//  DataTestApp.swift
//  DataTest
//
//  Created by Scott Jann on 6/12/24.
//

import SwiftUI

@main
struct DataTestApp: App {
	private let sceneNavigationModel: NavigationModel

	init() {
		let navigationModel = NavigationModel()
		sceneNavigationModel = navigationModel
	}

    var body: some Scene {
        WindowGroup {
            ContentView()
				.environment(sceneNavigationModel)
        }
    }
}
