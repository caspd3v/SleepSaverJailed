//
//  ContentView.swift
//  ScreenSaver
//
//  Created by CaspD3V on 7/4/21.
//

import SwiftUI
import AVKit
import AVFoundation

struct ContentView: View {
    
    var body: some View {
        WelcomeVideoController().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
