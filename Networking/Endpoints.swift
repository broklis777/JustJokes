//
//  Endpoints.swift
//  JustJokes
//
//  Created by Justs Jekabsons on 01/02/2026.
//

import Foundation

enum Endpoints {
    static let baseURL = "https://v2.jokeapi.dev/joke/"
    
    private static let requredFields = [
        "single"
    ]
    
    static let theme = "Any" //for now and for testing purposes
    
    //static let Joke = "\(baseURL)/\(theme)?type=\(requredFields)"
    static let Joke = "\(baseURL)/\(theme)?type=single"
    
}
