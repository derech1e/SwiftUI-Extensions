//
//  RoundedButtonStyle.swift
//  
//
//  Created by Thomas on 14.05.22.
//

import SwiftUI

public struct RoundedButtonStyle: ButtonStyle {
    public let primaryColor: Color
    public let secondaryColor: Color
    
    public init(primaryColor: Color, secondaryColor: Color) {
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
    }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(
                configuration.isPressed ? LinearGradient(gradient: Gradient(colors: [primaryColor.opacity(0.6), secondaryColor.opacity(0.6)]), startPoint: .leading, endPoint: .trailing) : LinearGradient(gradient: Gradient(colors: [primaryColor, secondaryColor]), startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(16)
            .padding(.horizontal, 20)
    }
}
