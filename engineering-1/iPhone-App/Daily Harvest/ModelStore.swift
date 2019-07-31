//
//  ModelStore.swift
//  Daily Harvest
//
//  Created by Dasmer Singh on 7/31/19.
//  Copyright © 2019 Dasmer Singh. All rights reserved.
//

import Foundation

class ModelStore {

    let allProducts: [Product] = {
        guard let path = Bundle.main.path(forResource: "products", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: []),
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: [Dictionary<String, AnyObject>]],
            let productDictionaries = json["products"] else { return [] }
        return productDictionaries.compactMap { Product(dictionary: $0) }
    }()

    let allIngredients: [Ingredient] = {
        guard let path = Bundle.main.path(forResource: "ingredients", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: []),
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: [Dictionary<String, AnyObject>]],
            let ingredientDictionaries = json["ingredients"] else { return [] }
        return ingredientDictionaries.compactMap { Ingredient(dictionary: $0) }
    }()
}
