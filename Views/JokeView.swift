//
//  JokeView.swift
//  JustJokes
//
//  Created by Justs Jekabsons on 01/02/2026.
//

import SwiftUI

struct JokeView: View {
    @Environment(JokeRepository.self) private var repository
    @State private var viewModel: JokeViewModel?
    
    var body: some View {
        NavigationStack {
            VStack {
                if let currentJoke = viewModel?.joke {
                    Text(currentJoke.joke)
                        .font(.largeTitle)
                        .padding()
                } else {
                    ProgressView("Loading a joke...")
                }
                Button("Next joke") {
                    Task {
                        await viewModel?.loadJoke()
                    }
                }
            }
            .navigationTitle("Just Jokes")
        }
        .onAppear{
                    if viewModel == nil {
                        viewModel = JokeViewModel(repository: repository)
                    }
                }
                .task{
                    await viewModel?.loadJoke()
                }

    }
}
