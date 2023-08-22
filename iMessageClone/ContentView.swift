//
//  ContentView.swift
//  iMessageClone
//
//  Created by Cecilia Chen on 8/20/23.
//

import SwiftUI
import StreamChatSwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = iMessageChannelListViewModel()
    @StateObject var channelHeaderLoader = ChannelHeaderLoader()
    var viewFactory: iMessageViewFactory
    
    var body: some View {
        NavigationView {
            ChannelList(
                factory: viewFactory,
                channels: viewModel.channels,
                selectedChannel: $viewModel.selectedChannel,
                swipedChannelId: $viewModel.swipedChannelId,
                scrollable: true,
                onlineIndicatorShown: viewModel.onlineIndicatorShown(for:),
                imageLoader: channelHeaderLoader.image(for:),
                onItemTap: { channel in
                    viewModel.selectedChannel = channel.channelSelectionInfo
                },
                onItemAppear: viewModel.checkForChannels(index:),
                channelNaming: viewModel.name(forChannel:),
                channelDestination: viewFactory.makeChannelDestination(),
                trailingSwipeRightButtonTapped: viewModel.onDeleteTapped(channel:),
                trailingSwipeLeftButtonTapped: viewModel.muteTapped(_:),
                leadingSwipeButtonTapped: { _ in }
            )
            .alert(isPresented: $viewModel.alertShown) {
                switch viewModel.channelAlertType {
                case let .deleteChannel(channel):
                    return Alert(
                        title: Text("Delete channel"),
                        message: Text("Are you sure you want to delete this channel?"),
                        primaryButton: .destructive(Text("Delete")) {
                            viewModel.delete(channel: channel)
                        },
                        secondaryButton: .cancel()
                    )
                default:
                    return Alert.defaultErrorAlert
                }
            }
            .navigationTitle("Messages")
            .toolbar {
                iMessageChannelListHeader()
            }
        }
    }
}

#Preview {
    ContentView(viewFactory: iMessageViewFactory())
}
