//
//  People.swift
//  StarWars
//
//  Created by Wandeep Basra on 23/11/2022.
//

import Foundation

struct People: Decodable {
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let homeworld: String
    let films: [String]
    let species: [String]
    let vehicles: [String]
    let starships: [String]
    let url: String
    let created: String
    let edited: String

    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender
        case homeworld
        case films
        case species
        case vehicles
        case starships
        case url
        case created
        case edited
    }
}

extension People {
    static let sample = People(name: "Sample Person", height: "", mass: "", hairColor: "", skinColor: "", eyeColor: "", birthYear: "", gender: "", homeworld: "", films: [], species: [], vehicles: [], starships: [], url: "", created: "", edited: "")
}
