//
//  ContentView.swift
//  Landmarks
//
//  Created by 远路蒋 on 2023/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    var body: some View {
        TabView (selection: $selection,
                 content:  {
            CategoryHome()
                .tabItem { Label("Featured", systemImage: "star") }
                .tag(Tab.featured)
            LandmarkList()
                .tabItem { Label("List", systemImage: "list.bullet") }
                .tag(Tab.list)
        })
        
            
    }
}

#Preview {
    /// Add the model object to the environment, which makes the object avaliable to any subview
    ContentView().environment(ModelData())
}
