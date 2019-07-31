//
//  ProductsViewModel.swift
//  Daily Harvest
//
//  Created by Dasmer Singh on 7/31/19.
//  Copyright © 2019 Dasmer Singh. All rights reserved.
//

import Foundation

struct ProductsViewModel {

    // MARK: Properties

    var products: [Product]
    var filteredIngredients = Set<Ingredient>() {
        didSet {
            if filteredIngredients.count > 0 {
                // If a product contains any of the filtered ingredients, display it in product results.
                let filteredIngredientIDs = filteredIngredients.map { $0.id }
                products = modelStore.allProducts.filter { $0.ingredientIDs.intersection(filteredIngredientIDs).count > 0 }
            } else {
                products = modelStore.allProducts
            }
        }
    }
    var filtersBarButtonItemTitle: String {
        return "Ingredient Filters (" + String(filteredIngredients.count) + ")"
    }

    private let modelStore: ModelStore


    // MARK: Initialization

    init(modelStore: ModelStore) {
        self.modelStore = modelStore
        products = modelStore.allProducts
    }
}
