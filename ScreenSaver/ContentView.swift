//
//  ContentView.swift
//  ScreenSaver
//
//  Created by CaspD3V on 7/4/21.
//

import SwiftUI
import AVKit
import AVFoundation

final class WelcomeVideoController : UIViewControllerRepresentable {
    var playerLooper: AVPlayerLooper?
    func makeUIViewController(context: UIViewControllerRepresentableContext<WelcomeVideoController>) ->
        AVPlayerViewController {
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
        try? AVAudioSession.sharedInstance().setActive(true)
            let controller = AVPlayerViewController()
            controller.showsPlaybackControls = false
            
        guard let path = Bundle.main.path(forResource: "screen1", ofType:"m4v") else {
                debugPrint("screen1.mp4 not found")
                return controller
            }
                    
            let asset = AVAsset(url: URL(fileURLWithPath: path))
            let playerItem = AVPlayerItem(asset: asset)
            let queuePlayer = AVQueuePlayer()
            
            playerLooper = AVPlayerLooper(player: queuePlayer, templateItem: playerItem)
            queuePlayer.play()
            controller.player = queuePlayer
                
            return controller
        }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<WelcomeVideoController>) {
    }
}

final class WelcomeVideoController1 : UIViewControllerRepresentable {
    var playerLooper: AVPlayerLooper?
    func makeUIViewController(context: UIViewControllerRepresentableContext<WelcomeVideoController1>) ->
        AVPlayerViewController {
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
        try? AVAudioSession.sharedInstance().setActive(true)
            let controller = AVPlayerViewController()
            controller.showsPlaybackControls = false
            
        guard let path = Bundle.main.path(forResource: "screen2", ofType:"m4v") else {
                debugPrint("screen1.mp4 not found")
                return controller
            }
                    
            let asset = AVAsset(url: URL(fileURLWithPath: path))
            let playerItem = AVPlayerItem(asset: asset)
            let queuePlayer = AVQueuePlayer()
            
            playerLooper = AVPlayerLooper(player: queuePlayer, templateItem: playerItem)
            queuePlayer.play()
            controller.player = queuePlayer
                
            return controller
        }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<WelcomeVideoController1>) {
    }
}

struct ContentView: View {
    
    @State private var showingGame = true

    var body: some View {
        ZStack {
            
            if showingGame {
                WelcomeVideoController1().frame(idealWidth:230,idealHeight:500).aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                } else {
                    WelcomeVideoController().frame(idealWidth:230,idealHeight:500).aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                }
            
            
            VStack {
                
                HStack {
                    Spacer()
                    Button(action: {
                        showingGame.toggle()
                    }
) {
                        Image("settings").resizable().frame(minWidth:0,maxWidth:.infinity,minHeight:0,maxHeight: .infinity).padding(30.0).opacity(0.0)
                    }
                }
                Spacer()
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
