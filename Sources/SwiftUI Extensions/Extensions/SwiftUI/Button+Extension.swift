//
//  File.swift
//  
//
//  Created by Thomas on 14.05.22.
//

import Foundation
import SwiftUI

extension Button where Label == HStack<TupleView<(Image, Text, Spacer)>> {
    public init(_ title: String, symbol: String, action: @escaping () -> Void) {
        self.init(action: action) {
            HStack(spacing: 12) {
                Image(systemName: symbol)
                Text(title)
                Spacer()
            }
        }
    }
    
    public init(_ title: LocalizedStringKey, symbol: String, action: @escaping () -> Void) {
        self.init(action: action) {
            HStack(spacing: 12) {
                Image(systemName: symbol)
                Text(title)
                Spacer()
            }
        }
    }
}
