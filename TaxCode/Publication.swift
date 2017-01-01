//
//  Publication.swift
//  taxcode
//
//  Created by Matthew Bailey on 12/18/16.
//  Copyright © 2016 BaileyMatthew. All rights reserved.
//

import Foundation

class Publication : NSObject {
    
    var number : Int = 0
    var name : String = ""
    var revisionYear : Int = 0
    
    init(number: Int, name : String, revisionYear : Int) {
        super.init()
        
        self.number = number
        self.name = name
        self.revisionYear = revisionYear
    }
}
