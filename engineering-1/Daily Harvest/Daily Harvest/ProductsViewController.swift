//
//  ViewController.swift
//  Daily Harvest
//
//  Created by Dasmer Singh on 7/31/19.
//  Copyright © 2019 Dasmer Singh. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    private var viewModel = ProductsViewModel() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Products"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Filter Ingredients", style: .plain, target: nil, action: nil)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.products[indexPath.row].name
        return cell
    }
}

