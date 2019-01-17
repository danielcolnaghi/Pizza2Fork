//
//  RecipeCell.swift
//  Food2Fork
//
//  Created by Daniel Colnaghi on 16/01/2019.
//  Copyright © 2019 Daniel Colnaghi. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgRecipe: UIImageView!
    
    override func prepareForReuse() {
        lblTitle.text = nil
        imgRecipe.image = nil
    }
    
    var recipeModel: Recipe? {
        willSet {
            if let recipe = newValue {
                lblTitle.text = recipe.title
                imgRecipe.loadFrom(url: recipe.imageURL)
            } else {
                prepareForReuse()
            }
        }
    }
}
