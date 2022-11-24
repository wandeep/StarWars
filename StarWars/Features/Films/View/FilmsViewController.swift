//
//  FilmsViewController.swift
//  StarWars
//
//  Created by Wandeep Basra on 23/11/2022.
//

import UIKit

class FilmsViewController: UIViewController {
    
    let viewModel: FilmsViewModel
    
    let tableView = UITableView()
    let cellIdentifier = "filmCellIdentifier"
    let spinner = UIActivityIndicatorView()
    
    var didSelectFilm: ((Film) -> Void)?
    
    init(viewModel: FilmsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        title = "Star Wars Films"
        
        setupTableView()
        setupSpinner()
        fetchFilms()
    }

}

private extension FilmsViewController {
    
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
    
    func fetchFilms() {
        Task {
            startSpinner()
            await viewModel.fetchFilms()
            stopSpinner()
            tableView.reloadData()
        }
    }
}

extension FilmsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let film = viewModel.films[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.textProperties.color = .systemYellow
        content.text = film.title
        cell.contentConfiguration = content
        
        var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
        backgroundConfig.backgroundColor = .black
        cell.backgroundConfiguration = backgroundConfig
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let film = viewModel.films[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: false)
        didSelectFilm?(film)
    }
    
}
