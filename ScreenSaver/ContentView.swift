//
//  ContentView.swift
//  ScreenSaver
//
//  Created by CaspD3V on 7/4/21.
//

import SwiftUI
import Combine
import AVKit
import AVFoundation

final class teighteen : UIViewControllerRepresentable {
    var playerLooper: AVPlayerLooper?
    func makeUIViewController(context: UIViewControllerRepresentableContext<teighteen>) ->
        AVPlayerViewController {
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
        try? AVAudioSession.sharedInstance().setActive(true)
            let controller = AVPlayerViewController()
            controller.showsPlaybackControls = false
            
        guard let path = Bundle.main.path(forResource: "screen1", ofType:"m4v") else {
                debugPrint("screen1.m4v not found")
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
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<teighteen>) {
    }
}

final class tnineteen : UIViewControllerRepresentable {
    var playerLooper: AVPlayerLooper?
    func makeUIViewController(context: UIViewControllerRepresentableContext<tnineteen>) ->
        AVPlayerViewController {
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
        try? AVAudioSession.sharedInstance().setActive(true)
            let controller = AVPlayerViewController()
            controller.showsPlaybackControls = false
            
        guard let path = Bundle.main.path(forResource: "screen2", ofType:"m4v") else {
                debugPrint("screen2.m4v not found")
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
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<tnineteen>) {
    }
}

final class Earth : UIViewControllerRepresentable {
    var playerLooper: AVPlayerLooper?
    func makeUIViewController(context: UIViewControllerRepresentableContext<Earth>) ->
        AVPlayerViewController {
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
        try? AVAudioSession.sharedInstance().setActive(true)
            let controller = AVPlayerViewController()
            controller.showsPlaybackControls = false
            
        guard let path = Bundle.main.path(forResource: "earth", ofType:"mp4") else {
                debugPrint("earth.mp4 not found")
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
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<Earth>) {
    }
}



struct ContentView: View {
    
    @State private var hideStatusBar = true
    @State var screens = 0
    
    func screenView() -> AnyView {
         switch screens {
         case 0: return AnyView(tnineteen())
         case 1: return AnyView(teighteen())
         case 2: return AnyView(Earth())
        
         default:
            return AnyView(tnineteen())
         }
    }

    
    
    var body: some View {
        
        ZStack {
            
            screenView().frame(idealWidth:230,idealHeight:500).aspectRatio(contentMode: .fill)
               .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            
            VStack {
                
                HStack {
                    Spacer()
                    Button(action: {
                        if screens < 2{
                        self.screens += 1
                        } else {
                            self.screens -= 2
                        }
                    }
) {
                        Image("settings").resizable().frame(minWidth:0,maxWidth:.infinity,minHeight:0,maxHeight: .infinity).padding(30.0).opacity(0.0)
                    }
                }
                Spacer()
            }
            
        }
        
        .statusBar(hidden: hideStatusBar)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
