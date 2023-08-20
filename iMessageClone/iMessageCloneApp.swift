//
//  iMessageCloneApp.swift
//  iMessageClone
//
//  Created by Cecilia Chen on 8/20/23.
//

import SwiftUI

import StreamChat
import StreamChatSwiftUI

@main
struct iMessageCloneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ChatChannelListView(viewFactory: iMessageViewFactory())
        }
    }
}
