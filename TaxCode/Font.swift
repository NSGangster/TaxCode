//
//  Font.swift
//  taxcode
//
//  Created by Matthew Bailey on 12/17/16.
//  Copyright © 2016 BaileyMatthew. All rights reserved.
//

import Foundation
import UIKit

class Font : UIFont {
    
    enum Style: String {
        case thin = "AvenirNext-Thin"
        case light = "AvenirNext-Light"
        case regular = "AvenirNext-Regular"
        case medium = "AvenirNext-Medium"
        case demiBold = "AvenirNext-DemiBold"
        case bold = "AvenirNext-Bold"
    }
    
    fileprivate static func getFont(style: Style, with size: CGFloat) -> UIFont {
        var font = UIFont.systemFont(ofSize: size)
        if let f = UIFont(name: style.rawValue, size: size) {
            font = f
        }
        return font
    }
    
    public static func thin(withSize size: CGFloat) -> UIFont {
        return getFont(style: .thin, with: size)
    }
    
    public static func light(withSize size: CGFloat) -> UIFont {
        return getFont(style: .light, with: size)
    }
    
    public static func regular(withSize size: CGFloat) -> UIFont {
        return getFont(style: .regular, with: size)
    }
    
    public static func medium(withSize size: CGFloat) -> UIFont {
        return getFont(style: .medium, with: size)
    }
    
    public static func bold(withSize size: CGFloat) -> UIFont {
        return getFont(style: .bold, with: size)
    }
    
    public static func demiBold(withSize size: CGFloat) -> UIFont {
        return getFont(style: .demiBold, with: size)
    }
    
}
