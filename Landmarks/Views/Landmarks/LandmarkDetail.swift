//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by 远路蒋 on 2023/12/22.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        ScrollView() {
            MapView(coordinate: landmark.locationCoordinate).frame(height: 300)
            CircleImage(image: landmark.image).offset(y: -130).padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    /// use landmarkIndex with the modelData object to ensure that the button updates the isFavorite property of the landmark stored in your model object
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }.font(.subheadline)
                
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            
            .padding()
        }.navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: ModelData().landmarks[2]).environment(modelData)
}
