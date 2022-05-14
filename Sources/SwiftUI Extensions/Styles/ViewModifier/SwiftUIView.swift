//
//  WideLinkStyle.swift
//  
//
//  Created by Thomas on 14.05.22.
//

import SwiftUI

struct WideLinkStyle: ViewModifier {
    private let isDestructive: Bool
    private let color: Color
    private let cornerRadius: CGFloat
    
    public init(isDestructive: Bool, color: Color, cornerRadius: CGFloat) {
        self.isDestructive = isDestructive
        self.color = color
        self.cornerRadius = cornerRadius
    }
    
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
                .font(.title3.weight(.semibold))
                .foregroundColor(Color(.systemBackground))
            Spacer()
        }
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .background(isDestructive ? Color.red : color)
        .cornerRadius(cornerRadius)
        .padding(.horizontal)
    }
}
