//
//  Movie.swift
//  Ejemplo 4 - NavApp
//
//  Created by Proteco on 03/09/22.
//

import Foundation

struct Movie: Decodable {
    
    let id: Int
    let title: String
    let year: String
    let runtime: String
    let genres: [String]
    let director: String
    let actors: String
    let plot: String
    let posterURL: String
    
    enum CodingKeys: String, CodingKey{
        case id
        case title
        case year
        case runtime
        case genres
        case director
        case actors
        case plot
        case posterURL = "poster_url"
    }
}
