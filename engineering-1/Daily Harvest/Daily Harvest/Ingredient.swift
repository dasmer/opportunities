//
//  Ingredient.swift
//  Daily Harvest
//
//  Created by Dasmer Singh on 7/31/19.
//  Copyright © 2019 Dasmer Singh. All rights reserved.
//

import Foundation

struct Ingredient: Equatable, Hashable {

    let id: String
    let name: String
    let isAllergen: Bool

    init?(dictionary: Dictionary<String, AnyObject>) {
        guard let id = dictionary["id"] as? Int,
            let name = dictionary["name"] as? String,
            let isAllergen = dictionary["is_allergen"] as? Bool else { return nil }

        self.id = String(id)
        self.name = name
        self.isAllergen = isAllergen
    }
}
