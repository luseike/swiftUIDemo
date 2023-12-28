//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 远路蒋 on 2023/12/21.
//

import SwiftUI

@main
struct LandmarksApp: App {
    
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(modelData)
        }
    }
}
