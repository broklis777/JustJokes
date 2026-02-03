//
//  Joke.swift
//  JustJokes
//
//  Created by Justs Jekabsons on 01/02/2026.
//

import Foundation

struct Joke: Identifiable, Codable {
    let joke: String
    let id: Int
    let category: String
}
