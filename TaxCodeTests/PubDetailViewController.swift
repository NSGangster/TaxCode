//
//  ViewController.swift
//  taxcode
//
//  Created by Matthew Bailey on 11/30/16.
//  Copyright © 2016 BaileyMatthew. All rights reserved.
//

import UIKit
import Kanna

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var textViews : [UITextView] = []
    
    let margin = CGFloat(15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        if let path = Bundle.main.path(forResource: "p3_ar01", ofType: "html") {
            let url = URL(fileURLWithPath: path)
            
            if let html = HTML(url: url, encoding: .utf8) {
                
                let allStrings = HTMLParser.parse(html: html)
                
                addTextViewsToScrollViewWith(strings: allStrings)
                
            }
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        layoutScrollView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addTextViewsToScrollViewWith(strings : [NSAttributedString]) {
        
        for string in strings {
            let textView = UITextView(frame: .zero)
            textView.isEditable = false
            textView.isSelectable = false
            textView.isScrollEnabled = false
            textView.attributedText = string
            scrollView.addSubview(textView)
            textViews.append(textView)
        }
    }
    
    func layoutScrollView() {
        
        var yOff = margin
        
        for (i, textView) in textViews.enumerated() {
            let size = textView.getSizeForWidth(scrollView.frame.width)
            textView.frame = CGRect(x: margin, y: yOff, width: size.width - (2 * margin), height: size.height)
            yOff += size.height
        }
        
        yOff += margin
        
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: yOff)
        
    }
    
    
}

extension UITextView {
    func getSizeForWidth(_ width : CGFloat) -> CGSize {
        let newSize = self.sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = self.frame
        newFrame.size = CGSize(width: max(newSize.width, width), height: newSize.height)
        return newFrame.size
    }
}

