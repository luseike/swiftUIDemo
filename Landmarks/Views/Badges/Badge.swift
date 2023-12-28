//
//  Badge.swift
//  Landmarks
//
//  Created by 远路蒋 on 2023/12/25.
//

import SwiftUI

struct Badge: View {
    var badgeSymbols: some View {
        ForEach(0 ..< 8) { index in
            RotatedBadgeSymbol(angle: Angle(degrees: Double(index) / Double(8) * 360.0)).opacity(0.5)
        }
    }
    var body: some View {
        ZStack(content: {
            
            BadgeBackground()
            
            /// You use GeometryReader to dynamically draw, position, and size views instead of hard-coding numbers that might not be correct when you reuse a view somewhere else in your app, or on a different-sized display
            ///
            /// GeometryReader dynamically reports size and position information about the parent view and the device, and updates whenever the size changes; for example, when the user rotates their iphone
            /// 使用GeometryReader可以动态绘制、定位和调整视图大小，动态报告父视图和设备的大小和位置信息，并在大小发生变化时更新
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }).scaledToFit()
        
    }
}

#Preview {
    Badge()
}
