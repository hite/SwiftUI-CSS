//
//  File.swift
//  
//
//  Created by hite on 2020/11/3.
//

import Foundation
import Combine
import SwiftUI

class Responsive: ObservableObject {
    /// For example. the size of view in sketch file designed for iPhone 6 should larger  on iPhone by 1.104 ( 414 / 375) times.
    /// so the factor = 1.104
    @Published var factor: CGFloat
    
    init(_ factor: CGFloat) {
        self.factor = factor
    }
    convenience init(designSize: CGRect) {
        var factor: CGFloat = 1
        if designSize.equalTo(.zero) {
            factor = 1
        } else {
            #if os(iOS)
            // Code specific to iOS
            let size = UIScreen.main.bounds.size
            factor = size.width / designSize.width
            #elseif os(macOS)
            // Code specific to macOS
            factor = 1// maybe 1 is not right number.
            #else
            factor = 1
            #endif
        }
        
        self.init(factor)
    }
    
    public func r(_ standardSize: CGFloat) -> CGFloat {
        return self.factor * standardSize
    }
}
