//
//  MainCoordinator.swift
//  StarWars
//
//  Created by Wandeep Basra on 23/11/2022.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    @MainActor func start() {
        let filmsVC = FilmsViewController(viewModel: FilmsViewModel())
        filmsVC.didSelectFilm = { [weak self] film in
            self?.showDetail(for: film)
        }
        navigationController.pushViewController(filmsVC, animated: false)
    }
    
    @MainActor func showDetail(for film: Film) {
        let viewModel = FilmDetailViewModel()
        viewModel.film = film
        let filmDetailVC = FilmDetailViewController(viewModel: viewModel)
        navigationController.pushViewController(filmDetailVC, animated: true)
    }
}
