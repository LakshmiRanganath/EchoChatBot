//
//  MessageImageView.swift
//  EchoChatBot
//
//  Created by Lakshmi Ranganatha Hema on 21/09/24.
//


import SwiftUI

struct MessageImageView: View {
    var image: UIImage
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 200)
            .background(RoundedRectangle(cornerRadius: 10, style: .circular))
    }
}

