//
//  File.swift
//  
//
//  Created by Thomas on 14.05.22.
//

import Foundation

extension String {
    
    public var numberOfLines: Int {
        return self.components(separatedBy: "\n").count
    }
    
    public func isInt() -> Bool {
        
        if let _ = Int(self) {
            return true
        }
        
        return false
    }
    
    public func isFloat() -> Bool {
        
        if let _ = Float(self) {
            return true
        }
        
        return false
    }
    
    public func isDouble() -> Bool {
        let str = self.split(separator: ",").joined(separator: ["."])
        if let _ = Double(String(str)) {
            return true
        }
        
        return false
    }
}
