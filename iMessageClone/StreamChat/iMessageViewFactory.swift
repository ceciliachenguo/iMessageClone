//
//  iMessageViewFactory.swift
//  iMessageClone
//
//  Created by Cecilia Chen on 8/20/23.
//

import Foundation
import StreamChatSwiftUI
import StreamChat
import SwiftUI

class iMessageViewFactory: ViewFactory {
    
    @Injected(\.chatClient) var chatClient: ChatClient
    
    var channelId: ChannelId?
    
}
