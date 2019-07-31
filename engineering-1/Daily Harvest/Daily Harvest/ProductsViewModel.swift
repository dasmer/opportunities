//
//  ProductsViewModel.swift
//  Daily Harvest
//
//  Created by Dasmer Singh on 7/31/19.
//  Copyright © 2019 Dasmer Singh. All rights reserved.
//

import Foundation

struct ProductsViewModel {

    var products = AllProducts
    var filteredIngredients = Set<Ingredient>() {
        didSet {
            if filteredIngredients.count > 0 {
                // If a product contains any of the filtered ingredients, display it in product results.
                let filteredIngredientIDs = filteredIngredients.map { $0.id }
                products = AllProducts.filter { $0.ingredientIDs.intersection(filteredIngredientIDs).count > 0 }
            } else {
                products = AllProducts
            }
        }
    }
    var filtersBarButtonItemTitle: String {
        return "Ingredient Filters (" + String(filteredIngredients.count) + ")"
    }
}

private var AllProducts: [Product] = {
    guard let path = Bundle.main.path(forResource: "products", ofType: "json"),
    let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: []),
    let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: [Dictionary<String, AnyObject>]],
        let productDictionaries = json["products"] else { return [] }
    return productDictionaries.compactMap { Product(dictionary: $0) }
}()
