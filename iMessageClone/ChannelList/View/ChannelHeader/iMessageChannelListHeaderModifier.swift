//
//  iMessageChannelListHeaderModifier.swift
//  iMessageClone
//
//  Created by Cecilia Chen on 8/22/23.
//

import SwiftUI
import StreamChatSwiftUI

struct iMessageChannelListHeaderModifier: ChannelListHeaderViewModifier {
    var title:String
    
    func body(content: Content) -> some View {
        content.toolbar {
            iMessageChannelListHeader()
        }
    }
}
