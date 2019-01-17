//
//  Recipe.swift
//  Food2Fork
//
//  Created by Daniel Colnaghi on 16/01/2019.
//  Copyright © 2019 Daniel Colnaghi. All rights reserved.
//

import Foundation

struct Recipe: Codable {
    
    let title: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case imageURL = "image_url"
    }
}
