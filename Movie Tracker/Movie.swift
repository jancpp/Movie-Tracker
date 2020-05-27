//
//  Movie.swift
//  Movie Tracker
//
//  Created by Jan Polzer on 5/25/20.
//  Copyright © 2020 Apps KC. All rights reserved.
//

import Foundation

struct Movie: Identifiable {
    var id = UUID()
    var title = ""
    var rating = 3.0
    var seen = false
}

// The movies are stored only as long as app is open (for demonstration purpose only)
class MovieStorage: ObservableObject {
    @Published var movies = [Movie]()
}
