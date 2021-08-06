//
//  ContentView.swift
//  MusicStreamingApp
//
//  Created by TI Digital on 04/08/21.
//

import SwiftUI


struct MenuView: View {
    
    @ObservedObject var data = MusicViewModel()
    @State private var currentAlbum: AlbumDummyModel?
    var body: some View {
        NavigationView{
            ScrollView{
                ScrollView(.horizontal, showsIndicators: false, content: {
                    LazyHStack{
                        ForEach(data.albums, id: \.self, content: { album in
                            AlbumArt(album: album, isWithText: true).onTapGesture {
                                self.currentAlbum = album
                            }
                        })
                    }
                })
                LazyVStack{
                    if data.albums.first == nil{
                        EmptyView()
                    }
                    else{
                        ForEach((currentAlbum?.songs ?? data.albums.first?.songs) ?? [Song(name: "Song 1", time: "2.36"),
                                                                                      Song(name: "Song 1", time: "2.36"),
                                                                                      Song(name: "Song 1", time: "2.36"),
                                                                                      Song(name: "Song 1", time: "2.36")],id: \.id, content: { song in
                                                                                        SongCell(album: currentAlbum ?? data.albums.first!, song: song)
                                                                                      })
                        
                    }
                }
            }
            .navigationTitle("My Band Name")
            .onAppear{
                data.loadAlbums()
            }
        }
        
    }
}

struct AlbumArt: View {
    var album: AlbumDummyModel
    var isWithText: Bool
    var body: some View {
        ZStack(alignment: .bottom,content:{
            Image(album.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 170, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            if isWithText == true {
                ZStack{
                    Blur(style:  .dark)
                    Text(album.name).foregroundColor(.white)
                }.frame(height: 60,alignment: .center)
            }
            
        }).frame(width: 170, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).clipped().cornerRadius(20).shadow(radius: 10).padding(20)
        
    }
}

struct SongCell: View {
    var album : AlbumDummyModel
    var song: Song
    var body: some View {
        HStack{
            NavigationLink(
                destination: PlayerView(album: album, song: song),
                label: {
                    HStack{
                        ZStack{
                            Circle().frame(width: 50, height: 50, alignment: .center).foregroundColor(.blue)
                            Circle().frame(width: 20, height: 20, alignment: .center).foregroundColor(.white)
                        }
                        Text(song.name).bold()
                        Spacer()
                        Text(song.time)
                    }.padding(10)
                }).buttonStyle(PlainButtonStyle())
            
        }.padding(10)
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
