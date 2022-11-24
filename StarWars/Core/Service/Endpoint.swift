//
//  Endpoint.swift
//  StarWars
//
//  Created by Wandeep Basra on 23/11/2022.
//

import Foundation

enum Endpoint {
    case films
    case custom(String)
    
    private var urlComponents: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "swapi.dev"
        return urlComponents
    }
    
    var url: URL? {
        switch self {
        case .films:
            var urlComponents = urlComponents
            urlComponents.path = "/api/films"
            return urlComponents.url
        case .custom(let urlString):
            return URLComponents(string: urlString)?.url
        }
    }
}
