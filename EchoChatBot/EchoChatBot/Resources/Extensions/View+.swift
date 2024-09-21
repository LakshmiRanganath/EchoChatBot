//
//  View+.swift
//  EchoChatBot
//
//  Created by Lakshmi Ranganatha Hema on 21/09/24.
//
import SwiftUI

extension View {
    func customCornerRadius(_ radius: CGFloat, corners: UIRectCorner = [.topLeft, .topRight, .bottomRight, .bottomLeft], topLeadingRadius: CGFloat = 0, toptrailingRadius: CGFloat = 0, bottomLeadingRadius: CGFloat = 0, bottomtrailingRadius: CGFloat = 0) -> some View {
        Group {
            if #available(iOS 16.0, *) {
                clipShape(UnevenRoundedRectangle(topLeadingRadius: topLeadingRadius, bottomLeadingRadius: bottomLeadingRadius, bottomTrailingRadius: bottomtrailingRadius, topTrailingRadius: toptrailingRadius))
            } else {
                clipShape( RoundedCorner(radius: radius, corners: corners) )
            }
        }
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
