//
//  ViewController.swift
//  DemoImageCache
//
//  Created by Kavita Malagavi on Aug-3-2020.
//  Copyright © 2020 Kavita Malagavi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    var viewModel = DataViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getData()
    }
  
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        setupTableViewDelagates()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
    }
    
    func setupTableViewDelagates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func getData() {
        viewModel.fetchData(successCallback: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.title = self.viewModel.getTitle()
            }
        }) {
            print("Failed")
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rowCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCell else { return UITableViewCell()}
        cell.selectionStyle = .none
        cell.layoutIfNeeded()

        let model = viewModel.getDataForRow(index: indexPath.row)
        cell.model = model

        return cell
    }
}

