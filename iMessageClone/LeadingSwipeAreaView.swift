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
            ActionItemButton(imageName: "pin.fill") {
                buttonTapped(channel)
            }
                .frame(width: buttonWidth)
                .foregroundColor(.white)
                .background(Color.yellow)
            
            Spacer()
        }
    }
}
