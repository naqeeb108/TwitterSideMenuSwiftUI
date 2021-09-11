//
//  Home.swift
//  TwitterSideMenuSwiftUI
//
//  Created by Mac on 11/09/2021.
//

import SwiftUI

struct Home: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        
        VStack {
            HStack {
                
                Button(action: {
                    showMenu.toggle()
                }, label: {
                    Image("dp")
                        .resizable()
                        .frame(width: 35, height: 35)
                })
                
                Spacer()
                
                Button(action: {
                    //do nothing for now
                }, label: {
                    Image("spark")
                        .resizable()
                        .frame(width: 35, height: 35)
                })
            }
            .overlay(
                Image("twitter")
                    .resizable()
                    .frame(width: 35, height: 35)
            )
            .padding([.leading,.trailing])
            
            Divider()
            
            Spacer()
            
            Text("Home")
            
            Spacer()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
