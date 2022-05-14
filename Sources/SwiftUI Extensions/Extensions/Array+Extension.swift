//
//  File.swift
//  
//
//  Created by Thomas on 14.05.22.
//

import Foundation

extension Array where Element: Equatable {
    @discardableResult
    public mutating func replace(_ element: Element, with new: Element) -> Bool {
        if let f = self.firstIndex(where: { $0 == element}) {
            self[f] = new
            return true
        }
        return false
    }
}
