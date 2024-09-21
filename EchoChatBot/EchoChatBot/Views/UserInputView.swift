//
//  UserInputView.swift
//  EchoChatBot
//
//  Created by Lakshmi Ranganatha Hema on 21/09/24.
//

import SwiftUI

struct UserInputView: View {
    @Binding var messageText: String
    @Binding var showImagePicker: Bool
    @Binding var selectedImage: UIImage?
    @Binding var messages: [Message]
    
    var body: some View {
        HStack {
            // If an image is selected, display it beside the text field
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: ViewConstants.userInputImageSize, height: ViewConstants.userInputImageSize)
                    .cornerRadius(ViewConstants.viewCornerRadius)
                    .padding(.trailing, 8)
            }
            
            TextField("Enter message", text: $messageText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(minHeight: 30)
            
            Button(action: { showImagePicker = true }) {
                Image(systemName: "photo")
                    .padding()
                    .frame(width: ViewConstants.userInputImageSize, height: ViewConstants.userInputImageSize)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(ViewConstants.viewCornerRadius)
            }
            
            Button(action: sendMessage) {
                Image(systemName: "paperplane.fill")
                    .padding()
                    .background(Color.blue)
                    .foregroundStyle(Color.white)
                    .frame(width: ViewConstants.userInputImageSize, height: ViewConstants.userInputImageSize)
                    .cornerRadius(ViewConstants.viewCornerRadius)
            }
        }
        .padding()
    }
    
    func sendMessage() {
        guard !messageText.isEmpty || selectedImage != nil else { return }
        
        // Add user message with both text and image (if selected) and current timestamp
        let userMessage = Message(content: messageText.isEmpty ? nil : messageText, image: selectedImage, isUserMessage: true, timestamp: Date())
        
        withAnimation(.snappy(duration: 1.0)) {
            messages.append(userMessage)
            messageText = "" // clear the text field
            selectedImage = nil // clear the selected image
        }
        
        // Simulate bot response with both text and image
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let botMessage = Message(content: userMessage.content, image: userMessage.image, isUserMessage: false, timestamp: Date())
            withAnimation(.snappy(duration: 1.0)) {
                messages.append(botMessage)
            }
        }
    }
}
