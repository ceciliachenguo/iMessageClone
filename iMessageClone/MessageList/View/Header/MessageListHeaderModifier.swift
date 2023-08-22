//
//  MessageListHeaderModifier.swift
//  iMessageClone
//
//  Created by Cecilia Chen on 8/22/23.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

struct MessageListHeaderModifier: ChatChannelHeaderViewModifier {
    var channel: ChatChannel
    
    @State private var infoScreenShown = false
    @State private var videoScreenShown = false
    
    func body(content: Content) -> some View {
        content.toolbar {
            MessageListHeader(
                viewModel: MessageListHeaderViewModel(channel: channel),
                isInfoSheetShown: $infoScreenShown,
                isVideoSheetShown: $videoScreenShown)
        }
        .sheet(isPresented: $infoScreenShown) {
            ChatChannelInfoView(channel: channel)
        }
        .sheet(isPresented: $videoScreenShown) {
            Text("Video not implemented yet.")
        }
    }
}
