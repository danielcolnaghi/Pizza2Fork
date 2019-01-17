//
//  F2FApi.swift
//  Food2Fork
//
//  Created by Daniel Colnaghi on 16/01/2019.
//  Copyright © 2019 Daniel Colnaghi. All rights reserved.
//

/* Food2Fork
 https://www.food2fork.com/api/search
 key: API Key
 q: (optional) Search Query (Ingredients should be separated by commas). If this is omitted top rated recipes will be returned.
 sort: (optional) How the results should be sorted. (r,t)
 page: (optional) Used to get additional results
 
 https://www.food2fork.com/api/get
 key: API Key
 rId: Id of desired recipe as returned by Search Query
*/

import Foundation

final class F2FApi {
    static let shared = F2FApi()
    
    private let key = "9d3ef89f3531de9c418107aeedd8c486"
    
    typealias RecipeResponse = (_ recipes: [Recipe]) -> Void
    typealias FailResponse = (_ errorMessage: String) -> Void
    
    private init() { }
    
    func requestRecipe() {
        //TODO: implement method to get details from recipe
    }
    
    func searchRecipe(query: String, success: @escaping RecipeResponse, fail: @escaping FailResponse ) {
        
        let url = URL(string: "https://www.food2fork.com/api/search?key=\(key)&q=\(query)")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response = try JSONDecoder().decode(F2FSearchApiResponse.self, from: data)
                success(response.recipes)
                
            } catch {
                fail("Ops, something when wrong.")
            }
            
        }.resume()

    }
}
