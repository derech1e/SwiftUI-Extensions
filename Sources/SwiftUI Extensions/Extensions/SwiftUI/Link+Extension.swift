//
//  File.swift
//  
//
//  Created by Thomas on 14.05.22.
//

import SwiftUI

extension Link where Label == HStack<TupleView<(Image, Text, Spacer)>> {
    public init(_ title: String, symbol: String, destination: URL) {
        self.init(destination: destination, label: {
            HStack(spacing: 12) {
                Image(systemName: symbol)
                Text(title)
                Spacer()
            }
        })
    }
    
    public init(_ title: LocalizedStringKey, symbol: String, destination: URL) {
        self.init(destination: destination, label: {
            HStack(spacing: 12) {
                Image(systemName: symbol)
                Text(title)
                Spacer()
            }
        })
    }
}
