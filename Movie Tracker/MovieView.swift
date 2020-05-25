//
//  ContentView.swift
//  Movie Tracker
//
//  Created by Jan Polzer on 5/21/20.
//  Copyright © 2020 Apps KC. All rights reserved.
//

import SwiftUI

struct MovieView: View {
    
    @State var title = ""
    @State var rating = 3.0
    @State var seen = false
    
    var body: some View {
        List {
            Section {
                SectionTitle(title: "Title")
                TextField("Movie Titile", text: $title)
            }
            Section {
                SectionTitle(title: "Rating")
                HStack {
                    Spacer()
                    Text(String(repeating: "★", count: Int(rating))).foregroundColor(.yellow).font(.title)
                    Spacer()
                }
            }
            Section {
                Slider(value: $rating, in: 1...5, step: 1)
            }
            Section {
                SectionTitle(title: "Seen")
                Toggle(isOn: $seen) {
                    if title == "" {
                        Text("I have seen this movie")
                    } else {
                        Text ("I have seen \(title)")
                    }
                }
            }
            Section {
                Button(action: {}) {
                    HStack {                Spacer()
                        Text("Save")
                        Spacer()
                    }
                }
            }
        }.listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}

struct SectionTitle: View {
    var title: String
    var body: some View {
        Text(title).font(.caption).foregroundColor(.blue)
    }
}
