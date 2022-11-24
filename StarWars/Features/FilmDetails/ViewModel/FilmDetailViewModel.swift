//
//  FilmDetailViewModel.swift
//  StarWars
//
//  Created by Wandeep Basra on 23/11/2022.
//

import Foundation

@MainActor
final class FilmDetailViewModel: NSObject {

    let webService: WebServiceProtocol
    
    var film: Film?
    var people: [People] = []

    init(webService: WebServiceProtocol = WebService()) {
        self.webService = webService
    }
    
    func fetchPeople() async {
        guard let peopleUrls = film?.characters else { return }

        for urlString in peopleUrls {
            async let result = webService.fetch(endpoint: .custom(urlString), responseType: People.self)
            
            switch await (result) {
            case .success(let person):
                people.append(person)
            case .failure(let error):
                print("fetchPeople error: \(error)")
            }
        }
    }
}
