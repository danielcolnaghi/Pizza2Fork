//
//  F2FSearchApiResponse.swift
//  Food2Fork
//
//  Created by Daniel Colnaghi on 16/01/2019.
//  Copyright © 2019 Daniel Colnaghi. All rights reserved.
//

import Foundation

struct F2FSearchApiResponse: Codable {
    
    let count: Int
    let recipes: [Recipe]
    
    enum CodingKeys: String, CodingKey {
        case count
        case recipes
    }
}
