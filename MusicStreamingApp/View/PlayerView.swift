//
//  PlayerView.swift
//  MusicStreamingApp
//
//  Created by TI Digital on 05/08/21.
//

import SwiftUI
import Firebase
import AVFoundation

struct PlayerView: View {
    @State var album: AlbumDummyModel
    @State var song: Song
    
    @State var player = AVPlayer()
    
    @State var isPlaying : Bool = false
    
    var body: some View {
        ZStack {
            Image(album.image).resizable().edgesIgnoringSafeArea(.all)
            Blur(style: .dark).edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                AlbumArt(album: album, isWithText: false)
                Text(song.name).font(.title).fontWeight(.light).foregroundColor(.white)
                Spacer()
                ZStack{
                    Color.white.cornerRadius(20).shadow(radius: 10)
                    HStack {
                        Button(action: self.previous, label: {
                            Image(systemName:"arrow.left.circle").resizable()
                        }).frame(width: 50, height: 50, alignment: .center).foregroundColor(Color.black.opacity(0.2))
                        Button(action: self.playPause, label: {
                            Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill").resizable()
                        }).frame(width: 70, height: 70, alignment: .center).padding()
                        Button(action: self.next, label: {
                            Image(systemName: "arrow.right.circle").resizable()
                        }).frame(width: 50, height: 50, alignment: .center).foregroundColor(Color.black.opacity(0.2))
                    }
                    
                }.edgesIgnoringSafeArea(.bottom).frame(height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .onAppear{
                /**ini adalah firebase storage klu ambil*/
                //         let storage = Storage.storage().reference(forURL: )
                //                storage.downloadURL{(url,error) in
                //                    if error != nil {
                //                        print(error)
                //                    } else {
                //                        let url  = URL(string:   "https://apio.kompas.id/soundwave/?blogtype=editorial&berkas=presiden-jokowi-hadiri-ktt-asean.mp3")
                //                        let player = AVPlayer(url: url!)
                //                        player.play()
                //                    }
                //                }
                self.playAudio()
            }
        }
    }
    
    func playAudio(){
        guard let url = URL.init(string: self.song.file ) else { return }
        let playerItem = AVPlayerItem.init(url: url)
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch(let error) {
            print(error.localizedDescription)
        }
        player = AVPlayer.init(playerItem: playerItem)
        player.play()
        isPlaying=true
    }
    
    func playPause() {
        if isPlaying == true {
            player.pause()
        } else {
            player.play()
        }
        self.isPlaying.toggle()
    }
    
    func next() {
        if let currentIndex = album.songs.firstIndex(of: song){
            if currentIndex == album.songs.count - 1{
            }
            else{
                player.pause()
                song = album.songs[currentIndex + 1]
                self.playAudio()
            }
            
        }
    }
    
    func previous() {
        if let currentIndex = album.songs.firstIndex(of: song){
            if currentIndex == 0 {
            }
            else{
                player.pause()
                song = album.songs[currentIndex - 1]
                self.playAudio()
            }
            
        }
    }
    
    func loadAudio(radioURL: String) {
        
        
    }
}

