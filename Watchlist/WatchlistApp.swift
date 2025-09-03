//
//  WatchlistApp.swift
//  Watchlist
//
//  Created by Jourdese Palacio on 9/2/25.
//

import SwiftUI
import SwiftData

@main
struct WatchlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Movie.self)
        }
    }
}
