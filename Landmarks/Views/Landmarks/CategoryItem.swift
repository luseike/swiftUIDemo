//
//  CategoryItem.swift
//  Landmarks
//
//  Created by 远路蒋 on 2023/12/27.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    var body: some View {
        VStack(alignment: .leading, content: {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundStyle(.primary)
                .font(.caption)
        }).padding(.leading, 15)
    }
}

#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
