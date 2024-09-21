//
//  Message.swift
//  EchoChatBot
//
//  Created by Lakshmi Ranganatha Hema on 21/09/24.
//

import SwiftUI

struct Message: Identifiable {
    let id = UUID()
    let content: String?
    let image: UIImage?
    let isUserMessage: Bool
    let timestamp: Date?

    init(content: String?, image: UIImage?, isUserMessage: Bool, timestamp: Date?) {
        self.content = content
        self.image = image
        self.isUserMessage = isUserMessage
        self.timestamp = timestamp
    }
}
