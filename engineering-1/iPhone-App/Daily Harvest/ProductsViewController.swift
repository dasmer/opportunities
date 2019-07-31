//
//  ViewController.swift
//  Daily Harvest
//
//  Created by Dasmer Singh on 7/31/19.
//  Copyright © 2019 Dasmer Singh. All rights reserved.
//

import UIKit

class ProductsViewController: UITableViewController {

    // MARK: Properties

    private var viewModel: ProductsViewModel {
        didSet {
            tableView.reloadData()
            resetFiltersBarButtonItem()
        }
    }

    private let modelStore = ModelStore()


    // MARK: Initialization

    init() {
        viewModel = ProductsViewModel(modelStore: modelStore)
        super.init(style: .plain)
        title = "Products"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        resetFiltersBarButtonItem()
    }


    // MARK: UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }


    // MARK: UITableViewDelegate

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.products[indexPath.row].name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }


    // MARK: Private Functions

    @objc private func didSelectShowIngredientsFilter() {
        let viewController = FilterViewController(modelStore: modelStore)
        viewController.delegate = self
        viewController.filteredIngredients = viewModel.filteredIngredients
        present(UINavigationController(rootViewController: viewController), animated: true, completion: nil)
    }

    private func resetFiltersBarButtonItem () {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: viewModel.filtersBarButtonItemTitle,
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(didSelectShowIngredientsFilter))
    }
}

extension ProductsViewController: FilterViewControllerDelegate {

    func didCancel() {
        dismiss(animated: true, completion: nil)
    }

    func didFinishFilteringForIngredient(ingredients: Set<Ingredient>) {
        viewModel.filteredIngredients = ingredients
        dismiss(animated: true, completion: nil)
    }
}

