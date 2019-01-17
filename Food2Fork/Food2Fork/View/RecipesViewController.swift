//
//  RecipesViewController.swift
//  Food2Fork
//
//  Created by Daniel Colnaghi on 16/01/2019.
//  Copyright © 2019 Daniel Colnaghi. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController {

    @IBOutlet weak var tblRecipes: UITableView!
    let recipesVM = RecipesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipesVM.loadPizzaRecipes(success: {
            
            DispatchQueue.main.async {
                self.tblRecipes.reloadData()
            }
            
        }) { (errorMessage) in
            //TODO: show a friendly error message - internet connection, api error, parse error
        }
    }
}

extension RecipesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: implement to show details from selected recipe
        //perform segue with selected recipe
    }
}

extension RecipesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return recipesVM.recipesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell") as? RecipeCell else { return UITableViewCell() }
        
        cell.recipeModel = recipesVM.recipe(From: indexPath.row)
        
        return cell
    }
}
