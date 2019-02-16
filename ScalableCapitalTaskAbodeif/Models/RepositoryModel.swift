//
//  RepositoryModel.swift
//  ScalableCapitalTaskAbodeif
//
//  Created by Ahmed Abodeif on 2/16/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import Foundation


class RepositoryModel: Codable {
    
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
    
}
