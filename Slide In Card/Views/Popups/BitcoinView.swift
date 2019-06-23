//
//  BitcoinView.swift
//  Slide In Card
//
//  Created by Leonardo Bilia on 6/21/19.
//  Copyright © 2019 Leonardo Bilia. All rights reserved.
//

import SwiftUI

struct BitcoinView : View {
    
    @State var showingAlert = false
    private let BTCAddress = "1yNzm2ndVaVdBQfZHdT5uLQga8QRn3Quo"
    
    var body: some View {
        
        VStack {
            Spacer()
            
            VStack {
                Text("Deposit Address")
                    .font(.system(size: 22)).bold()
                    .foregroundColor(.white)
                    .padding(24)
                
                Image("qrcode")
                    .resizable()
                    .frame(width: 180, height: 180)
                    .tapAction { self.copyAddress() }
                    .presentation($showingAlert) {
                        Alert(title: Text("Copied"), message: Text("Address has been copied."), dismissButton: .default(Text("Ok")))
                }
                
                Text(BTCAddress)
                    .font(.subheadline)
                    .lineLimit(nil)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 36, trailing: 16))
                
                Spacer()
                HStack {
                    Spacer()
                }
            }
            .padding()
            .background(Color(red: 32/255, green: 36/255, blue: 45/255))
            .cornerRadius(32)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 30, x: 0, y: -20)
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    fileprivate func copyAddress() {
        UIPasteboard.general.string = self.BTCAddress
        self.showingAlert = true
    }
}

#if DEBUG
struct BitcoinView_Previews : PreviewProvider {
    static var previews: some View {
        BitcoinView()
            .preferredColorScheme(.dark)
    }
}
#endif
