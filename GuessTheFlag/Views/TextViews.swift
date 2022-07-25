//
//  TextViews.swift
//  GuessTheFlag
//
//  Created by Jiaming Guo on 2022-07-24.
//

import SwiftUI

struct LargeText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle.weight(.bold))
            .foregroundColor(.white)
    }
}

struct MediumText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .font(.title.bold())
    }
}

struct SmallText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline.weight(.heavy))
            .foregroundColor(.white)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                LargeText(text: "lol")
                MediumText(text: "lol")
                SmallText(text: "lol")
            }
        }
    }
}
