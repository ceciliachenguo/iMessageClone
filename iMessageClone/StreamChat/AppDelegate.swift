//
//  AppDelegate.swift
//  iMessageClone
//
//  Created by Cecilia Chen on 8/20/23.
//
import StreamChat
import StreamChatSwiftUI
import UIKit
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {

    var streamChat: StreamChat?

    var chatClient: ChatClient = {
        var config = ChatClientConfig(apiKey: .init("8br4watad788"))
        config.applicationGroupIdentifier = "group.io.getstream.iOS.ChatDemoAppSwiftUI"

        let client = ChatClient(config: config)
        return client
    }()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                        [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        var colors = ColorPalette()
        colors.tintColor = Color("pinkAccentColor")
        
        var fonts = Fonts()
        
        let images = Images()
        images.reactionLoveBig = UIImage(systemName: "heart.fill")!

        let appearance = Appearance(colors: colors, images: images, fonts: fonts)
        
        // The `StreamChat` instance we need to assign
        streamChat = StreamChat(chatClient: chatClient, appearance: appearance)

        // Calling the `connectUser` functions
        connectUser()

        return true
    }

    // The `connectUser` function we need to add.
    private func connectUser() {
        // This is a hardcoded token valid on Stream's tutorial environment.
        let tokenString = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibHVrZV9za3l3YWxrZXIifQ.kFSLHRB5X62t0Zlc7nwczWUfsQMwfkpylC6jCUZ6Mc0"
        guard let token = try? Token(rawValue: tokenString) else {
            log.error("Invalid token.")
            return
        }

        // Call `connectUser` on our SDK to get started.
        chatClient.connectUser(
                userInfo: .init(id: "luke_skywalker",
                                name: "Luke Skywalker",
                                imageURL: URL(string: "https://vignette.wikia.nocookie.net/starwars/images/2/20/LukeTLJ.jpg")!),
                token: token
        ) { error in
            if let error = error {
                // Some very basic error handling only logging the error.
                log.error("connecting the user failed \(error)")
                return
            }
        }
    }
}
