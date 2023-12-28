//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by 远路蒋 on 2023/12/25.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    var body: some View {
        BadgeSymbol().padding(-60).rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees: 370))
}
