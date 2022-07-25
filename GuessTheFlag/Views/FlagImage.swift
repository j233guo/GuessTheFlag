//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Jiaming Guo on 2022-07-24.
//

import SwiftUI

struct FlagImage: View {
    var flagName: String
    
    var body: some View {
        Image(flagName)
            .renderingMode(.original)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(radius: 5)
    }
}

struct FlagImage_Previews: PreviewProvider {
    static var previews: some View {
        FlagImage(flagName: "UK")
    }
}
