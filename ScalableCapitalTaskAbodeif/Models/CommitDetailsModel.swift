//
//  CommitDetailsModel.swift
//  ScalableCapitalTaskAbodeif
//
//  Created by Ahmed Abodeif on 2/16/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import Foundation

class CommitModel: Codable {
    
    var commitDetails: CommitDetails?
    
    enum CodingKeys: String, CodingKey {
        case commitDetails = "commit"
    }
    
}

class CommitDetails: Codable {
    
    var message: String?
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
    }
}
