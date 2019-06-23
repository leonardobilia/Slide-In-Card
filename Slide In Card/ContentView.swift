//
//  ContentView.swift
//  Slide In Card
//
//  Created by Leonardo Bilia on 6/21/19.
//  Copyright © 2019 Leonardo Bilia. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var showCard = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    Button(action: { self.showCard.toggle() }) {
                        RoundedButtonView()
                    }
                    Spacer()
                }
                
                OverlayView(isOverlayActive: showCard)
                    .tapAction { if self.showCard { self.showCard.toggle() }}
                
                BitcoinView()
                    .tapAction { self.showCard.toggle() }
                    .offset(y: showCard ? 36 : UIScreen.main.bounds.height)
                    .animation(.basic(duration: 0.3, curve: .easeInOut))
            }
            .navigationBarTitle(Text("Bitcoin Wallet"))
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
#endif
