//
//  FilmDetailViewController.swift
//  StarWars
//
//  Created by Wandeep Basra on 23/11/2022.
//

import Foundation
import UIKit

class FilmDetailViewController: UIViewController {
    
    let tableView = UITableView()
    let cellIdentifier = "filmDetailCellIdentifier"
    
    let spinner = UIActivityIndicatorView()
    
    let viewModel: FilmDetailViewModel
    
    init(viewModel: FilmDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        title = viewModel.film?.title
        
        setupTableView()
        setupSpinner()
        fetchCharacters()
    }

}

private extension FilmDetailViewController {
    
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        // Constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func setupSpinner() {
        spinner.hidesWhenStopped = true
        view.addSubview(spinner)
        
        // Constraints
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func startSpinner() {
        spinner.startAnimating()
    }
    
    func stopSpinner() {
        spinner.stopAnimating()
    }
    
    func fetchCharacters() {
        Task {
            startSpinner()
            await viewModel.fetchPeople()
            stopSpinner()
            tableView.reloadData()
        }
    }
}

extension FilmDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = viewModel.people[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.textProperties.color = .systemYellow
        content.text = person.name
        cell.contentConfiguration = content
        
        var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
        backgroundConfig.backgroundColor = .black
        cell.backgroundConfiguration = backgroundConfig
        
        return cell
    }
}
