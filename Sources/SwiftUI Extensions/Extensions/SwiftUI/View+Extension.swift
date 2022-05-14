//
//  File.swift
//  
//
//  Created by Thomas on 14.05.22.
//

import Foundation
import SwiftUI

extension View {
    public func dismissToRoot() {
        let rootViewController = UIApplication.shared.connectedScenes
            .filter {$0.activationState == .foregroundActive }
            .map {$0 as? UIWindowScene }
            .compactMap { $0 }
            .first?.windows
            .filter({ $0.isKeyWindow }).first?.rootViewController
        
        rootViewController?.dismiss(animated: true)
    }
    
    public func transparentBox(_ opacity: Double = 0.2) -> some View {
        self
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.systemBackground)
                            .opacity(opacity))
            )
    }
    
    public func transparentBoxWithShadow(_ opacity: Double = 0.2, shadowRadius: CGFloat = 10) -> some View {
        self
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.systemBackground)
                            .opacity(opacity))
            )
            .clipped()
            .shadow(radius: shadowRadius)
    }
    
    public func leading() -> some View {
        HStack {
            self
            Spacer()
        }
    }
    
    public func trailing() -> some View {
        HStack {
            Spacer()
            self
        }
    }
    
    public func top() -> some View {
        VStack {
            self
            Spacer()
        }
    }
    
    public func bottom() -> some View {
        VStack {
            Spacer()
            self
        }
    }
    
    public func wideLinkStyle(isDestructive: Bool = false, color: Color = .blue, cornerRadius: CGFloat = 10) -> some View {
        modifier(WideLinkStyle(isDestructive: isDestructive, color: color, cornerRadius: cornerRadius))
    }
}
