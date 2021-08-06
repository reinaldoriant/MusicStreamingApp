//
//  MusicStreamingAppApp.swift
//  MusicStreamingApp
//
//  Created by TI Digital on 04/08/21.
//

import SwiftUI
import Firebase

@main
struct MusicStreamingAppApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MenuView()
        }
    }
}
