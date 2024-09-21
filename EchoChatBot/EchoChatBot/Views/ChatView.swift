//
//  ChatView.swift
//  EchoChatBot
//
//  Created by Lakshmi Ranganatha Hema on 21/09/24.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    @State private var messages: [Message] = []
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(messages.indices, id: \.self) { index in
                            let message = messages[index]
                            
                            VStack(alignment: message.isUserMessage ? .trailing : .leading) {
                                
                                TimeStampView(messageIndex: index, messages: messages)
                                
                                HStack {
                                    if message.isUserMessage {
                                        Spacer()
                                    }
                                    
                                    VStack(alignment: message.isUserMessage ? .trailing : .leading) {
                                        if let image = message.image {
                                            MessageImageView(image: image)
                                        }
                                        
                                        if message.content != nil {
                                            MessageTextView(message: message)
                                        }
                                    }
                                    
                                    if !message.isUserMessage {
                                        Spacer()
                                    }
                                }
                            }
                            .id(message.id)
                        }
                    }
                    .animation(.easeIn(duration: 0.3), value: messages.count)
                }
                .padding(.horizontal)
                .onChange(of: messages.count) { _ in
                    if let lastMessage = messages.last {
                        withAnimation {
                            proxy.scrollTo(lastMessage.id, anchor: .bottom)
                        }
                    }
                }
            }
            
            UserInputView(messageText: $messageText, showImagePicker: $showImagePicker, selectedImage: $selectedImage, messages: $messages)
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(selectedImage: $selectedImage, didFinishPicking: {})
                }
        }
    }
}
