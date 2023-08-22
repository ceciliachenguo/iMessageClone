//
//  iMessageChannelListItemView.swift
//  iMessageClone
//
//  Created by Cecilia Chen on 8/22/23.
//

import SwiftUI

struct iMessageChannelListItemView: View {
    let channelName: String
    let avatar: UIImage
    let lastMessageAt: Date
    let hasUnreadMessages: Bool
    let lastMessage: String
    let isMuted: Bool
    
    var lastMessageStamp:String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: lastMessageAt)
    }
    
    var body: some View {
        HStack {
            ZStack {
                if hasUnreadMessages {
                    Circle()
                        .foregroundColor(.blue)
                }
            }
            .frame(width: 12)
            
            Image(uiImage: avatar)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(channelName)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Text(lastMessageStamp)
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                }
                
                HStack(alignment: .top, spacing: 4) {
                    Text(lastMessage)
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, minHeight: 40, alignment: .topLeading)
                    
                    if isMuted {
                        Image(systemName: "speaker.slash")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.secondary)
                            .frame(width: 15)
                            .padding(.top, 4)
                    }
                }
            }
        }
        .padding(.vertical, 4)
        .background(Color(uiColor: .systemBackground))
    }
}

#Preview {
    Group {
        iMessageChannelListItemView(channelName: "Preview Channel", avatar: UIImage(named: "oval")!, lastMessageAt: Date(), hasUnreadMessages: true, lastMessage: "We have a lot of great ideas to bring forward the SDK in the future and it's going to be great!", isMuted: false)
            .previewLayout(.fixed(width: 400, height: 120))
            .padding()
        iMessageChannelListItemView(channelName: "Preview Channel", avatar: UIImage(named: "oval")!, lastMessageAt: Date(), hasUnreadMessages: true, lastMessage: "New", isMuted: true)
            .previewLayout(.fixed(width: 400, height: 120))
            .padding()
        
        iMessageChannelListItemView(channelName: "Preview Channel", avatar: UIImage(named: "oval")!, lastMessageAt: Date(), hasUnreadMessages: false, lastMessage: "We have a lot of great ideas to bring forward the SDK in the future and it's going to be great!", isMuted: true)
            .previewLayout(.fixed(width: 400, height: 120))
            .padding()
        
        iMessageChannelListItemView(channelName: "Preview Channel", avatar: UIImage(named: "oval")!, lastMessageAt: Date(), hasUnreadMessages: true, lastMessage: "We have a lot of great ideas to bring forward the SDK in the future and it's going to be great!", isMuted: false)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 400, height: 120))
            .padding()
        
        iMessageChannelListItemView(channelName: "Preview Channel", avatar: UIImage(named: "oval")!, lastMessageAt: Date(), hasUnreadMessages: false, lastMessage: "We have a lot of great ideas to bring forward the SDK in the future and it's going to be great!", isMuted: true)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 400, height: 120))
            .padding()
    }
}
