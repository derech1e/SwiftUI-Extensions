//
//  WideButtonStyle.swift
//  
//
//  Created by Thomas on 14.05.22.
//

import SwiftUI

public struct WideButtonStyle: ButtonStyle {
    private let isDestructive: Bool
    private let color: Color
    private let cornerRadius: CGFloat
    
    public init(isDestructive: Bool = false, color: Color = .blue, cornerRadius: CGFloat = 10) {
        self.isDestructive = isDestructive
        self.color = color
        self.cornerRadius = cornerRadius
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            
            configuration.label
                .foregroundColor(Color(.systemBackground))
                .font(Font.body.weight(.semibold))
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(isDestructive ? Color.red : color)
                .opacity(configuration.isPressed ? 0.75 : 1)
        )
    }
}
