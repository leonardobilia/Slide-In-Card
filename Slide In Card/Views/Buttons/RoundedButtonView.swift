//
//  RoundedButtonView.swift
//  Slide In Card
//
//  Created by Leonardo Bilia on 6/21/19.
//  Copyright © 2019 Leonardo Bilia. All rights reserved.
//

import SwiftUI

struct RoundedButtonView : View {
    var body: some View {
        
        Text("Receive Bitcoin")
            .font(.headline)
            .color(.white)
            .frame(width: 300, height: 60)
            .background(Color.orange)
            .cornerRadius(30)
            .padding()
    }
}

#if DEBUG
struct RoundedButtonView_Previews : PreviewProvider {
    static var previews: some View {
       
        Group {
            RoundedButtonView()
                .previewLayout(.sizeThatFits)
            
            RoundedButtonView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
#endif
