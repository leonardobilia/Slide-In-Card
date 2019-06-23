//
//  OverlayView.swift
//  Slide In Card
//
//  Created by Leonardo Bilia on 6/21/19.
//  Copyright © 2019 Leonardo Bilia. All rights reserved.
//

import SwiftUI

struct OverlayView : View {
    var isOverlayActive = false
    
    var body: some View {
        
        Color.black
            .opacity(isOverlayActive ? 0.3 : 0)
            .animation(.basic(duration: 0.1, curve: .easeInOut))
            .edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct OverlayView_Previews : PreviewProvider {
    static var previews: some View {
        OverlayView(isOverlayActive: true)
    }
}
#endif
