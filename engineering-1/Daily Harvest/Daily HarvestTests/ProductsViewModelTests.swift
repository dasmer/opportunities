//
//  Daily_HarvestTests.swift
//  Daily HarvestTests
//
//  Created by Dasmer Singh on 7/31/19.
//  Copyright © 2019 Dasmer Singh. All rights reserved.
//

import XCTest
@testable import Daily_Harvest

class ProductsViewModelTests: XCTestCase {

    func testViewModel() {

        let organicBananaIngredientDictionary: Dictionary<String, AnyObject> = [
            "id": 3 as AnyObject,
            "name": "Organic Banana" as AnyObject,
            "is_allergen": false as AnyObject
        ]
        let organicBananaIngredient = Ingredient(dictionary: organicBananaIngredientDictionary)!

        var viewModel = ProductsViewModel()
        viewModel.filteredIngredients = Set([organicBananaIngredient])

        XCTAssertTrue(viewModel.filtersBarButtonItemTitle == "Ingredient Filters (1)")
        XCTAssertTrue(viewModel.products.count == 4)

        let viewModelFilteredProductNames = viewModel.products.map { $0.name }
        XCTAssertTrue(viewModelFilteredProductNames.contains("Acai + Cherry"))
        XCTAssertTrue(viewModelFilteredProductNames.contains("Chocolate + Blueberry"))
        XCTAssertTrue(viewModelFilteredProductNames.contains("Cinnamon + Banana"))
        XCTAssertTrue(viewModelFilteredProductNames.contains("Ginger + Greens"))
    }
}
