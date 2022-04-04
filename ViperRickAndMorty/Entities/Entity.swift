//
//  Entity.swift
//  ViperRickAndMorty
//
//  Created by Oğuzhan Kabul on 4.04.2022.
//

import Foundation

struct MortyList: Codable {
    let results: [Morty]
}

struct Morty: Codable {
    let name: String
    let image: String
}
