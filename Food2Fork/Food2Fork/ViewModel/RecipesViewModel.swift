//
//  RecipesViewModel.swift
//  Food2Fork
//
//  Created by Daniel Colnaghi on 16/01/2019.
//  Copyright © 2019 Daniel Colnaghi. All rights reserved.
//

import Foundation

class RecipesViewModel {
    
    private var recipes: [Recipe]?
    
    typealias successResponse = () -> Void
    typealias failResponse = (_ errorMessage: String) -> Void
    
    func loadPizzaRecipes(success: @escaping successResponse, fail: @escaping failResponse) {
        
        F2FApi.shared.searchRecipe(query: "pizza", success: { (recipes) in
            self.recipes = recipes
            success()
        }) { (errorMessage) in
            fail(errorMessage)
        }
    }
    
    func recipe(From index: Int) -> Recipe? {
        return recipes?[index]
    }
    
    var recipesCount: Int {
        if let recipes = recipes {
            return recipes.count
        } else {
            return 0
        }
    }
}
