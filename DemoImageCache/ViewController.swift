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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func loadView() {
        super.loadView()
        safeArea = view.layoutMarginsGuide
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        setupTableViewDelagates()
        
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
            }
            print("Success")
        }) {
            print("Fail")
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCell else { return UITableViewCell()}       

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

