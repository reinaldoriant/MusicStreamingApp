//
//  MenuModel.swift
//  MusicStreamingApp
//
//  Created by TI Digital on 05/08/21.
//

import Foundation

struct AlbumDummyModel : Hashable {
    var id = UUID()
    var name : String
    var image: String
    var songs : [Song]
}

struct Song: Hashable {
    var id = UUID()
    var name : String
    var time : String
}

//var albums = [AlbumDummyModel(name: "Album 1", image: "img_1",
//                         songs: [Song(name: "Song 1", time: "2:36"),
//                                 Song(name: "Song 2", time: "2:36"),
//                                 Song(name: "Song 3", time: "2:36"),
//                                 Song(name: "Song 4", time: "2:36")
//                         ]),
//              AlbumDummyModel(name: "Album 2", image: "img_2",
//                                       songs: [Song(name: "Song 12", time: "2:36"),
//                                               Song(name: "Song 22", time: "2:36"),
//                                               Song(name: "Song 32", time: "2:36"),
//                                               Song(name: "Song 42", time: "2:36")
//                                       ]),
//              AlbumDummyModel(name: "Album 3", image: "img_3",
//                                       songs: [Song(name: "Song 13", time: "2:36"),
//                                               Song(name: "Song 23", time: "2:36"),
//                                               Song(name: "Song 33", time: "2:36"),
//                                               Song(name: "Song 43", time: "2:36")
//                                       ]),
//              AlbumDummyModel(name: "Album 4", image: "img_4",
//                                       songs: [Song(name: "Song 14", time: "2:36"),
//                                               Song(name: "Song 24", time: "2:36"),
//                                               Song(name: "Song 34", time: "2:36"),
//                                               Song(name: "Song 44", time: "2:36")
//                                       ]),
//              AlbumDummyModel(name: "Album 5", image: "img_5",
//                                       songs: [Song(name: "Song 15", time: "2:36"),
//                                               Song(name: "Song 25", time: "2:36"),
//                                               Song(name: "Song 35", time: "2:36"),
//                                               Song(name: "Song 45", time: "2:36")
//                                       ])]
