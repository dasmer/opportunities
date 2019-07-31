//
//  FilterViewController.swift
//  Daily Harvest
//
//  Created by Dasmer Singh on 7/31/19.
//  Copyright © 2019 Dasmer Singh. All rights reserved.
//

import UIKit

protocol FilterViewControllerDelegate: class {

    func didFinishFilteringForIngredient(ingredients: Set<Ingredient>)
}

class FilterViewController: UITableViewController {

    // MARK: Properties

    var delegate: FilterViewControllerDelegate?

    var filteredIngredients = Set<Ingredient>() {
        didSet {
            tableView.reloadData()
        }
    }


    // MARK: Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Filter By Ingredient"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(didTapResetFilters))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AllIngredients.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let ingredient = AllIngredients[indexPath.row]
        cell.textLabel?.text = ingredient.name
        cell.accessoryType = filteredIngredients.contains(ingredient) ? .checkmark : .none
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ingredient = AllIngredients[indexPath.row]

        if filteredIngredients.contains(ingredient) {
            filteredIngredients.remove(ingredient)
        } else {
            filteredIngredients.insert(ingredient)
        }
    }

    @objc private func didTapResetFilters() {
        filteredIngredients.removeAll()
    }

    @objc private func didTapDone() {
        delegate?.didFinishFilteringForIngredient(ingredients: filteredIngredients)
    }

}


private var AllIngredients: [Ingredient] = {
    guard let path = Bundle.main.path(forResource: "ingredients", ofType: "json"),
    let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: []),
    let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: [Dictionary<String, AnyObject>]],
        let ingredientDictionaries = json["ingredients"] else { return [] }
    return ingredientDictionaries.compactMap { Ingredient(dictionary: $0) }
}()
