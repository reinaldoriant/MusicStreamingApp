//
//  ContentView.swift
//  MusicStreamingApp
//
//  Created by TI Digital on 04/08/21.
//

import SwiftUI


struct MenuView: View {
    
    
    @State private var currentAlbum: AlbumDummyModel?
    var body: some View {
        NavigationView{
            ScrollView{
                ScrollView(.horizontal, showsIndicators: false, content: {
                    LazyHStack{
                        ForEach(albums, id: \.id, content: { album in
                            AlbumArt(album: album).onTapGesture {
                                currentAlbum = album
                            }
                        })
                    }
                })
                LazyVStack {
                    ForEach((currentAlbum?.songs ?? albums.first?.songs) ?? [Song(name: "Song 1", time: "2.36"),
                                                                                             Song(name: "Song 1", time: "2.36"),
                                                                                             Song(name: "Song 1", time: "2.36"),
                                                                                             Song(name: "Song 1", time: "2.36")],id: \.id, content: { song in
                                                                                                SongCell(song: song)
                                                                                    })
                   
                }
            }
        }
    }
}

struct AlbumArt: View {
    var album: AlbumDummyModel
    var body: some View {
        ZStack(alignment: .bottom,content:{
            Image(album.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 170, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            ZStack{
                Blur(style:  .dark)
                Text(album.name).foregroundColor(.white)
            }.frame(height: 60,alignment: .center)
           
        }).frame(width: 170, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).clipped().cornerRadius(20).shadow(radius: 10).padding(20)
        
    }
}

struct SongCell: View {
    var song: Song
    var body: some View {
        HStack{
            ZStack{
                Circle().frame(width: 50, height: 50, alignment: .center).foregroundColor(.blue)
                Circle().frame(width: 20, height: 20, alignment: .center).foregroundColor(.white)
            }
            Text(song.name).bold()
            Spacer()
            Text(song.time)
        }.padding(20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //        AlbumArt(album: AlbumDummyModel(name: "Album 1", image: "img_1",
        //                                        songs: [Song(name: "Song 1", time: "2:36"),
        //                                                Song(name: "Song 2", time: "2:36"),
        //                                                Song(name: "Song 3", time: "2:36"),
        //                                                Song(name: "Song 4", time: "2:36")
        //                                        ]))
        MenuView()
    }
}
