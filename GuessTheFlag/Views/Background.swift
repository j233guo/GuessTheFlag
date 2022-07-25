//
//  Background.swift
//  GuessTheFlag
//
//  Created by Jiaming Guo on 2022-07-24.
//

import SwiftUI

struct Background: View {
    var body: some View {
        RadialGradient(
            stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ],
            center: .top, startRadius: 200, endRadius: 700)
        .ignoresSafeArea()
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}
