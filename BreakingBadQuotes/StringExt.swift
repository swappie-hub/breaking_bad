//
//  StringExt.swift
//  BreakingBadQuotes
//
//  Created by Swapnil Chatterjee on 31/07/24.
//

import Foundation

extension String {
    
    func removeSpaces() -> String {
        self.replacingOccurrences(of: " ", with: "" )
    }
    func removeCaseAndSpaces() -> String {
        self.removeSpaces().lowercased()
    }
    
    
}
