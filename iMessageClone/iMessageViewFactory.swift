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

class iMessageViewFactory:ViewFactory {
    @Injected(\.chatClient) var chatClient: ChatClient
    
    func makeChannelListHeaderViewModifier(title: String) -> iMessageChannelListHeaderModifier {
        iMessageChannelListHeaderModifier(title: "Messages")
    }
    
    func makeChannelListItem(
        channel: ChatChannel,
        channelName: String,
        avatar: UIImage,
        onlineIndicatorShown: Bool,
        disabled: Bool,
        selectedChannel: Binding<ChannelSelectionInfo?>,
        swipedChannelId: Binding<String?>,
        channelDestination: @escaping (ChannelSelectionInfo) -> ChatChannelView<iMessageViewFactory>,
        onItemTap: @escaping (ChatChannel) -> Void,
        trailingSwipeRightButtonTapped: @escaping (ChatChannel) -> Void,
        trailingSwipeLeftButtonTapped: @escaping (ChatChannel) -> Void,
        leadingSwipeButtonTapped: @escaping (ChatChannel) -> Void
    ) -> some View {
        let listItem = iMessageChannelListItem(
            channel: channel,
            channelName: channelName,
            avatar: avatar,
            channelDestination: channelDestination,
            selectedChannel: selectedChannel,
            onItemTap: onItemTap
        )
        
        return ChatChannelSwipeableListItem<iMessageViewFactory, iMessageChannelListItem>(
            factory: self,
            channelListItem: listItem,
            swipedChannelId: swipedChannelId,
            channel: channel,
            trailingRightButtonTapped: trailingSwipeRightButtonTapped,
            trailingLeftButtonTapped: trailingSwipeLeftButtonTapped,
            leadingSwipeButtonTapped: leadingSwipeButtonTapped
        )
    }
    
    func makeLeadingSwipeActionsView(
        channel: ChatChannel,
        offsetX: CGFloat,
        buttonWidth: CGFloat,
        swipedChannelId: Binding<String?>,
        buttonTapped: @escaping (ChatChannel) -> Void
    ) -> some View {
        LeadingSwipeAreaView(
            channel: channel,
            buttonWidth: buttonWidth,
            swipedChannelId: swipedChannelId,
            buttonTapped: buttonTapped
        )
    }
    
    func makeTrailingSwipeActionsView(
        channel: ChatChannel,
        offsetX: CGFloat,
        buttonWidth: CGFloat,
        swipedChannelId: Binding<String?>,
        leftButtonTapped: @escaping (ChatChannel) -> Void,
        rightButtonTapped: @escaping (ChatChannel) -> Void
    ) -> some View {
        TrailingSwipeAreaView(
            channel: channel,
            buttonWidth: buttonWidth,
            swipedChannelId: swipedChannelId,
            leftButtonTapped: leftButtonTapped,
            rightButtonTapped: rightButtonTapped
        )
    }
}
