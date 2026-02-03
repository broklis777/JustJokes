//
//  APIClient.swift
//  JustJokes
//
//  Created by Justs Jekabsons on 01/02/2026.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case decodingError(Error)
    case noData
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        case .invalidResponse:
            return "Invalid response from server"
        case .decodingError(let error):
            return "Decoding error: \(error.localizedDescription)"
        case .noData:
            return "No data received"
        }
    }
}

actor APIClient {
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(session: URLSession = .shared) {
        self.session = session
        self.decoder = JSONDecoder()
    }
    
    func fetchJoke() async throws -> Joke {
        guard let url = URL(string: Endpoints.Joke) else {
            throw APIError.invalidURL
        }
        
        print("fetching jokes from: \(url)")
        
        do {
            let (data, response) = try await session.data(from: url)
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
                print("Headers: \(httpResponse.allHeaderFields)")
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response status code")
                if let httpResponse = response as? HTTPURLResponse {
                    print("Status code was: \(httpResponse.statusCode)")
                    
                }
                throw APIError.invalidResponse
            }
        
            do {
                let joke = try decoder.decode(Joke.self, from: data)
                print("Successfully decoded jokes")
                return joke
            } catch {
                print("Decoding Error: \(error)")
                //I'll implement this later. Maybe.
                throw APIError.decodingError(error)
            }
        } catch let error as APIError {
            throw error
        } catch {
            print("Network error")
            throw APIError.networkError(error)
        }
    }
}
