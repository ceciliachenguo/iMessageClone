//
//  LeadingSwipeAreaView.swift
//  iMessageClone
//
//  Created by Cecilia Chen on 8/22/23.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

struct LeadingSwipeAreaView: View {
    
    var channel: ChatChannel
    var buttonWidth: CGFloat
    @Binding var swipedChannelId: String?
    var buttonTapped: (ChatChannel) -> Void
    
    var body: some View {
        HStack {
            SwipeItemCustomButton(imageName: "PinnedIcon") {
                buttonTapped(channel)
            }
            .frame(width: buttonWidth)
            .background(Color.clear)
            
            Spacer()
        }
    }
}

public struct SwipeItemCustomButton: View {
    private var imageName: String
    private var action: () -> Void

    public init(imageName: String, action: @escaping () -> Void) {
        self.imageName = imageName
        self.action = action
    }

    public var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Spacer()
                Image(imageName)
                    .resizable()
                    .frame(width: 45, height: 45)
                    .padding(.horizontal)
                Spacer()
            }
        }
    }
}
