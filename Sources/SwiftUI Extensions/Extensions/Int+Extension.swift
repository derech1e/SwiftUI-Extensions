//
//  File.swift
//  
//
//  Created by Thomas on 14.05.22.
//

import Foundation


extension Int {
    public var asTimeString: String {
        let (hours, minutes, seconds) = (self / 3600, (self % 3600) / 60, (self % 3600) % 60)
        return "\(hours > 0 ? "\(hours)h " : "")\(minutes > 0 ? "\(minutes)m " : "")\(seconds)s"
    }
}
