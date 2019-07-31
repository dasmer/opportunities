//
//  Product.swift
//  Daily Harvest
//
//  Created by Dasmer Singh on 7/31/19.
//  Copyright © 2019 Dasmer Singh. All rights reserved.
//

import Foundation

struct Product {

    let id: String
    let name: String
    let collection: String
    let ingredientIDs: Set<String>

    init?(dictionary: Dictionary<String, AnyObject>) {
        guard let id = dictionary["id"] as? Int,
        let name = dictionary["name"] as? String,
        let collection = dictionary["collection"] as? String,
        let ingredientIDs = dictionary["ingredient_ids"] as? [Int] else { return nil }

        self.id = String(id)
        self.name = name
        self.collection = collection
        self.ingredientIDs = Set(ingredientIDs.map { String($0) })
    }
}
