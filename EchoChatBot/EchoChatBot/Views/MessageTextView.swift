//
//  MessageTextView.swift
//  EchoChatBot
//
//  Created by Lakshmi Ranganatha Hema on 21/09/24.
//

import SwiftUI

struct MessageTextView: View {
    var message: Message
    
    var body: some View {
        if let content = message.content {
            Text(content)
                .font(.caption)
                .padding(8)
                .background(
                    Rectangle()
                        .fill(message.isUserMessage ? Color.blue : Color.gray.opacity(0.2))
                        .frame(maxWidth: ViewConstants.messageViewWidth) // Adjust width as needed
                        .customCornerRadius(ViewConstants.viewCornerRadius, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], topLeadingRadius: ViewConstants.viewCornerRadius, toptrailingRadius: ViewConstants.viewCornerRadius, bottomLeadingRadius: message.isUserMessage ? ViewConstants.viewCornerRadius : 0, bottomtrailingRadius: message.isUserMessage ? 0 : ViewConstants.viewCornerRadius)
                    
                )
                .foregroundStyle(message.isUserMessage ? Color.white : Color.black)
                .transition(.opacity)
        }
    }
}
