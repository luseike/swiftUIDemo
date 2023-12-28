//
//  HikeBadge.swift
//  Landmarks
//
//  Created by 远路蒋 on 2023/12/27.
//

import SwiftUI

struct HikeBadge: View {
    var name: String
    var body: some View {
        VStack {
            /// badge 的绘制逻辑产生的结果取决于其渲染的帧的大小
            /// 为了确保所需要的外观，在300 x 300点的帧中进行绘制
            /// 要获得最终图形所需的尺寸，缩放渲染结果并将其放置在相对较小的框架中
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name).")
        }
    }
}

#Preview {
    HikeBadge(name: "Preview Testing")
}
