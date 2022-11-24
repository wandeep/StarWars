//
//  Film.swift
//  StarWars
//
//  Created by Wandeep Basra on 23/11/2022.
//

import Foundation

struct FilmsResponse: Decodable {
    let count: Int
    let results: [Film]
}

struct Film: Decodable {
    let title: String
    let episodeId: Int
    let openingCrawl: String
    let director: String
    let producer: String
    let releaseDate: String
    let species: [String]
    let starships: [String]
    let vehicles: [String]
    let characters: [String]
    let planets: [String]
    let url: String
    let created: String
    let edited: String

    enum CodingKeys: String, CodingKey {
        case title
        case episodeId = "episode_id"
        case openingCrawl = "opening_crawl"
        case director
        case producer
        case releaseDate = "release_date"
        case species
        case starships
        case vehicles
        case characters
        case planets
        case url
        case created
        case edited
    }
}

extension FilmsResponse {
    static let sample = FilmsResponse(count: 1, results: [Film.sample])
}

extension Film {
    static let sample = Film(title: "Sample Film", episodeId: 1, openingCrawl: "", director: "", producer: "", releaseDate: "", species: [], starships: [], vehicles: [], characters: [], planets: [], url: "", created: "", edited: "")
}

