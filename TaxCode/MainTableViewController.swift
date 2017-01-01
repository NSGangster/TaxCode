//
//  MainTableViewController.swift
//  taxcode
//
//  Created by Matthew Bailey on 12/18/16.
//  Copyright © 2016 BaileyMatthew. All rights reserved.
//

import Foundation
import UIKit
import Kanna

class MainTableViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "PubTable", ofType: "html") {
            let url = URL(fileURLWithPath: path)
            
            if let html = HTML(url: url, encoding: .utf8) {
                
                let pubs = HTMLParser.parseTable(html: html)
                
                print(pubs.count)
                
            }
        }
    }

}
