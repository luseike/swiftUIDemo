//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 远路蒋 on 2023/12/22.
//

import SwiftUI

struct LandmarkList: View {
    /// State is a value or a set of values
    /// can change over time
    /// affects a view's behavior, content, or layout
    /// use a property with the @State attribute to add state to a view
    @State private var showFavoritesOnly = false
    
    @Environment(ModelData.self) var modelData
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            
            ///  list dynamic (List initializer with data)
            ///  Lists work with identifiable data
            ///         passing along with your data a key path to a property that uniquely identifies each element
            ///         marking your data type conform to the Identifiable protocol
            List {
                
                /// A binding acts as a reference to a mutable state
                /// use the $ prefix to access a binding to a state variable, or one of its properties
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Favorites only")
                })
                ForEach(filteredLandmarks) {  landmark in
                    /// This creates one LandmarkRow for each element in the landmarks array
                    
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                
            }.animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList().environment(ModelData())
}
