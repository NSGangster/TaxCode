//
//  HTMLParser.swift
//  Pods
//
//  Created by Matthew Bailey on 12/17/16.
//
//

import Foundation
import UIKit
import Kanna

class HTMLParser {
    
    class func parse(html: HTMLDocument) -> [NSAttributedString] {
        
        var allStrings : [NSAttributedString] = []
        
        for section in html.css("div").filter({ $0.className == "section" }) {
            
            for title in section.css("h3").filter({ $0.className == "title" }) {
                guard var titleText = title.text else {
                    continue
                }
                
                titleText = titleText.cleanupThisJunk()
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.alignment = .center
                
                let titleAttrText = NSAttributedString(string: titleText, attributes: [NSFontAttributeName : Font.demiBold(withSize: 24), NSParagraphStyleAttributeName : paragraphStyle])
                
                allStrings.append(titleAttrText)
            }
            
            for paragraph in section.css("p") {
                
                guard var text = paragraph.text else {
                    continue
                }
                
                text = text.cleanupThisJunk()
                let paragraphText = NSMutableAttributedString(string: text, attributes: [NSFontAttributeName : Font.regular(withSize: 12)])
                
                for boldness in paragraph.css("b") {
                    
                    guard let boldText = boldness.text else {
                        continue
                    }
                    
                    guard let boldRange = text.range(of: boldText) else {
                        continue
                    }
                    
                    paragraphText.setAttributes([NSFontAttributeName : Font.bold(withSize: 12)], range: text.NSRangeFromRange(range: boldRange))
                    
                }
                
                allStrings.append(paragraphText)
            }
        }
        
        return allStrings
    }
    
    class func parseTable(html: HTMLDocument) -> [Publication] {
        
        var pubs : [Publication] = []
       
        for pub in html.xpath("//table/tbody/tr/td") {
            
            for row in pub.xpath("//td") {
                print(row.text!)
            }
        }
        
        
        
        
        return pubs
    }
    
    
}

extension String {
    
    func NSRangeFromRange(range : Range<String.Index>) -> NSRange {
        let utf16view = self.utf16
        let from = String.UTF16View.Index(range.lowerBound, within: utf16view)
        let to = String.UTF16View.Index(range.upperBound, within: utf16view)
        return NSMakeRange(from - utf16view.startIndex, to - from)
    }
    
    func cleanupThisJunk() -> String {
        
        var text = self
        
        text = text.replacingOccurrences(of: "  ", with: "")
        text = text.replacingOccurrences(of: "\n", with: "")
        text = text.replacingOccurrences(of: "..", with: ".")
        
        return text
    }
    
}
