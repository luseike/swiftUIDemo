//
//  CircleImage.swift
//  Landmarks
//
//  Created by 远路蒋 on 2023/12/21.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle()
                .stroke(.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("twinlake"))
}
