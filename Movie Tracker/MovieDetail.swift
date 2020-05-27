//
//  ContentView.swift
//  Movie Tracker
//
//  Created by Jan Polzer on 5/21/20.
//  Copyright © 2020 Apps KC. All rights reserved.
//

import SwiftUI

struct MovieDetail: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var movie: Movie
    let newMovie: Bool
    @EnvironmentObject var movieStorage: MovieStorage

    var body: some View {
        List {
            Section {
                SectionTitle(title: "Title")
                TextField("Movie Titile", text: $movie.title)
            }
            Section {
                SectionTitle(title: "Rating")
                HStack {
                    Spacer()
                    Text(String(repeating: "★", count: Int(movie.rating))).foregroundColor(.yellow).font(.title).accessibility(label: <#T##Text#>)
                    Spacer()
                }
            }
            Section {
                Slider(value: $movie.rating, in: 1...5, step: 1)
            }
            Section {
                SectionTitle(title: "Seen")
                Toggle(isOn: $movie.seen) {
                    if movie.title == "" {
                        Text("I have seen this movie")
                    } else {
                        Text ("I have seen \(movie.title)")
                    }
                }
            }
            Section {
                Button(action: {
                    if self.newMovie {
                        self.movieStorage.movies.append(self.movie)
                    } else {
                        for i in 0..<self.movieStorage.movies.count {
                            if self.movieStorage.movies[i].id == self.movie.id {
                                self.movieStorage.movies[i] = self.movie
                            }
                        }
                    }
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Spacer()
                        Text("Save")
                        Spacer()
                    }
                }.disabled(movie.title.isEmpty)
            }
        }.listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: Movie(), newMovie: true)
    }
}

struct SectionTitle: View {
    var title: String
    var body: some View {
        Text(title).font(.caption).foregroundColor(.blue)
    }
}
