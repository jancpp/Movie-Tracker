//
//  MovieList.swift
//  Movie Tracker
//
//  Created by Jan Polzer on 5/25/20.
//  Copyright © 2020 Apps KC. All rights reserved.
//

import SwiftUI

struct MovieList: View {
    
    @EnvironmentObject var movieStorage: MovieStorage
    @State var pushView = false
    
    var body: some View {
        NavigationView {
            List(movieStorage.movies) { currentMovie in
                NavigationLink(destination: MovieDetail(movie: currentMovie, newMovie: false)) {
                    Text(currentMovie.title)
                }
            }.navigationBarTitle("Movies").navigationBarItems(trailing: NavigationLink(destination: MovieDetail(movie: Movie(),newMovie: true)) {
                Image(systemName: "plus.square.fill")
            })
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
