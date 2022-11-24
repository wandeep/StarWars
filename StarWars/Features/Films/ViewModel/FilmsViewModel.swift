//
//  FilmsViewModel.swift
//  StarWars
//
//  Created by Wandeep Basra on 23/11/2022.
//

import Foundation

@MainActor
final class FilmsViewModel: NSObject {

    let webService: WebServiceProtocol

    var films: [Film] = []

    init(webService: WebServiceProtocol = WebService()) {
        self.webService = webService
    }
    
    func fetchFilms() async {
        let result = await webService.fetch(endpoint: .films, responseType: FilmsResponse.self)
        
        switch (result) {
        case .success(let filmsResponse):
            self.films = filmsResponse.results
        case .failure(let error):
            print("fetchFilms error: \(error)")
        }
    }
}
