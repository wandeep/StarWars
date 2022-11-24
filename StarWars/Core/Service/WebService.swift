//
//  WebService.swift
//  StarWars
//
//  Created by Wandeep Basra on 23/11/2022.
//

import Foundation

enum WebServiceError: Error {
    case invalidUrl
    case errorResponse
    case decodingError
    case fetchError
}

protocol WebServiceProtocol {
    func fetch<T: Decodable> (endpoint: Endpoint, responseType: T.Type) async -> Result<T, WebServiceError>
}

final class WebService: WebServiceProtocol {
    private let urlSession: URLSession
    
    required init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func fetch<T: Decodable> (endpoint: Endpoint, responseType: T.Type) async -> Result<T, WebServiceError> {
        do {
            guard let url = endpoint.url else {
                return .failure(.invalidUrl)
            }
            
            let (data, response) = try await urlSession.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                return .failure(.errorResponse)
            }
            
            if let decodedResponse = try? JSONDecoder().decode(responseType, from: data) {
                return .success(decodedResponse)
            } else {
                return .failure(.decodingError)
            }
        } catch {
            return .failure(.fetchError)
        }
    }
    
}
