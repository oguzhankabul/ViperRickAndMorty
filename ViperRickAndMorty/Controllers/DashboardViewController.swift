//
//  DashboardViewController.swift
//  ViperRickAndMorty
//
//  Created by Oğuzhan Kabul on 4.04.2022.
//

import UIKit

class DashboardViewController: Controller {
    
    var presenter: AnyPresenter?
    var morties: [Morty] = []

    private let tableView: UITableView = {
        let table = UITableView()
        table.register(DashboardCell.self, forCellReuseIdentifier: DashboardCell.reuseIdentifier)
        table.isHidden = true
        return table
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.backgroundColor = .white
        label.textColor = .red
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    func update(with results: [Morty]) {
        DispatchQueue.main.async {
            self.morties = results
            self.label.isHidden = true
            self.tableView.isHidden = false
            self.tableView.reloadData()
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            self.morties = []
            self.tableView.isHidden = true
            self.label.isHidden = false
            self.label.text = error
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    override func setupLayouts() {
        tableView.frame = view.bounds
        label.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        label.center = view.center
    }
    
    override func setupViews() {
        view.addSubviews([tableView,
                         label])
    }
    
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DashboardCell = tableView.dequeueReusableCell(for: indexPath)
        cell.titleLabel.text = morties[indexPath.row].name
        cell.image.load(stringUrl: morties[indexPath.row].image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return morties.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}

