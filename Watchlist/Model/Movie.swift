//
//  Movie.swift
//  Watchlist
//
//  Created by Jourdese Palacio on 9/2/25.
//

import Foundation
import SwiftData

@Model
class Movie {
    var title: String
    var genre: Genre
    
    init(title: String, genre: Genre) {
        self.title = title
        self.genre = genre
    }
}

extension Movie {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: Movie.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        let dummyMovies: [(String, Int)] = [
            ("Shadow Guardian", 1),
            ("Crimson Thunder", 2),
            ("Iron Sentinel", 7),
            ("Nightstrike", 9),
            ("Eclipse Force", 6),
            ("Stormbreaker", 12),
            ("Phoenix", 5),
            ("Chrono Titan", 10)
        ]

        for (title, raw) in dummyMovies {
            if let genre = Genre(rawValue: raw) {
                container.mainContext.insert(Movie(title: title, genre: genre))
            }
        }
        
        return container
    }
}
