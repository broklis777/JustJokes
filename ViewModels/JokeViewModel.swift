//
//  JokeViewModel.swift
//  JustJokes
//
//  Created by Justs Jekabsons on 01/02/2026.
//

import SwiftUI
import Observation

@Observable
class JokeViewModel {
    var joke: Joke?
    
    private var repository: JokeRepository
    
    init(repository: JokeRepository) {
        self.repository = repository
    }
    
    func loadJoke() async {
        self.joke = await repository.fetchJoke()
        print(self.joke)
    }
}
    
