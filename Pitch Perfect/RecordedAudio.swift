//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Joseph Thompson on 3/17/15.
//  Copyright (c) 2015 Joseph Thompson. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject{
    var filePathURL: NSURL!
    var title: String!
    
    
    init(filePathURL: NSURL, title: String) {
        self.filePathURL = filePathURL
        self.title = title
    }
}
