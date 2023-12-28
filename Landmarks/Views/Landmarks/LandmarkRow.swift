//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by 远路蒋 on 2023/12/22.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    var body: some View {
        HStack {
            landmark.image.resizable().frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            
            /// in SwiftUI blocks, use if statements to conditionally include views
            if landmark.isFavorite {
                Image(systemName: "star.fill").foregroundStyle(.orange)
            }
        }
    }
}

#Preview {
    /// Group is a container for grouping view content
    ///  Xcode renders the group's child views stacked as one preview in the canvas
    Group {
        LandmarkRow(landmark: ModelData().landmarks[0])
        LandmarkRow(landmark: ModelData().landmarks[1])
    }
    
}

