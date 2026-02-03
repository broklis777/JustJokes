//
//  JokeRepository.swift
//  JustJokes
//
//  Created by Justs Jekabsons on 03/02/2026.
//

import Foundation

@Observable
class JokeRepository {
    private let apiClient: APIClient
    private var joke: Joke?
    
    init(apiClient: APIClient = APIClient()) {
            self.apiClient = apiClient
        }
    
    @MainActor
    func fetchJoke() async -> Joke? {
        do {
            let fetchedJoke = try await apiClient.fetchJoke()
            return fetchedJoke
        } catch {
            print("error fetching joke")
            return nil
        }
    }
}
