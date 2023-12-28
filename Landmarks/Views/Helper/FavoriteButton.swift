//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by 远路蒋 on 2023/12/23.
//

import SwiftUI

struct FavoriteButton: View {
    /// The binding property wrapper enables you to read and write between a property that stores data and a view that displays and changes the data
    /// Because you use a binding, changes made inside thie view propagate back to the data source.
    @Binding var isSet: Bool
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label(
                title: { Text("Label") },
                icon: { Image(systemName: isSet ? "star.fill" : "star") }
            ).labelStyle(.iconOnly).foregroundStyle(isSet ? .orange : .gray)
        }
    }
}

#Preview {
    
    FavoriteButton(isSet: .constant(true))
}
