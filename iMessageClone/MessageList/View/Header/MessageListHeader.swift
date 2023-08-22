//
//  MessageListHeader.swift
//  iMessageClone
//
//  Created by Cecilia Chen on 8/22/23.
//

import SwiftUI

struct MessageListHeader: ToolbarContent {
    
    @ObservedObject var viewModel: MessageListHeaderViewModel
    @Binding var isInfoSheetShown: Bool
    @Binding var isVideoSheetShown: Bool
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Button {
                isInfoSheetShown = true
            } label: {
                VStack(spacing: 4) {
                    if let headerImage = viewModel.headerImage {
                        Image(uiImage: headerImage)
                            .resizable()
                            .frame(width: 20, height: 20)
                    } else {
                        Circle()
                            .fill(.cyan)
                            .frame(width: 20, height: 20)
                    }
                    
                    HStack(alignment: .firstTextBaseline, spacing: 2) {
                        Text(viewModel.channelName ?? "Unknown")
                            .font(.caption)
                            .foregroundColor(.primary)
                        
                        Image(systemName: "chevron.right")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 8, height: 8)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.bottom, 6)
            }
        }
    }
}
