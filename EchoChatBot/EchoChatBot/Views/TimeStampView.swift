//
//  TimeStampView.swift
//  EchoChatBot
//
//  Created by Lakshmi Ranganatha Hema on 21/09/24.
//

import SwiftUI

struct TimeStampView: View {
    let messageIndex: Int
    let messages: [Message]
    
    
    var body: some View {
        if shouldDisplayTime(for: messageIndex), let timestamp = messages[messageIndex].timestamp {
            Text(dateFormatter.string(from: timestamp))
                .font(.caption)
                .foregroundStyle(Color.gray)
                .padding(.bottom, 2)
        }
    }
    
    func shouldDisplayTime(for index: Int) -> Bool {
        guard index > 0 else { return true }
        let previousMessage = messages[index - 1]
        let currentMessage = messages[index]
        
        if let previousTimestamp = previousMessage.timestamp, let currentTimestamp = currentMessage.timestamp {
            let timeDifference = currentTimestamp.timeIntervalSince(previousTimestamp)
            return timeDifference > 60
        }
        return true
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        return formatter
    }()
}
