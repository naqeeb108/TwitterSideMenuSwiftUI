//
//  SideMenu.swift
//  TwitterSideMenuSwiftUI
//
//  Created by Mac on 11/09/2021.
//

import SwiftUI

struct SideMenu: View {
    
    //MARK:- Variables
    @Binding var showMenu: Bool
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            VStack(alignment: .leading, spacing: 10) {
                
                Image("dp")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                
                Text("Naqeeb Ahmed ")
                    .font(.title2)
                    .fontWeight(.bold)
                
                HStack(spacing: 10) {
                    
                    Button(action: {
                        //Click action
                    }, label: {
                        Label(
                            title: { Text("Followings") },
                            icon: {
                                Text("57")
                                    .fontWeight(.bold)
                            })
                    })
                    
                    Button(action: {
                        //Click action
                    }, label: {
                        Label(
                            title: { Text("Followers") },
                            icon: {
                                Text("33")
                                    .fontWeight(.bold)
                            })
                    })
                }
                .foregroundColor(.primary)
            }
            .padding(.horizontal)
            .padding(.leading)
            
            ScrollView(.vertical, showsIndicators: true) {
                
                VStack {
                    VStack(alignment: .leading, spacing: 35) {
                        sideMenuButtons(title: "Profile", icon: "profile", showMenu: $showMenu)
                        sideMenuButtons(title: "Lists", icon: "list", showMenu: $showMenu)
                        sideMenuButtons(title: "Topics", icon: "topic", showMenu: $showMenu)
                        sideMenuButtons(title: "Bookmarks", icon: "bookmark", showMenu: $showMenu)
                        sideMenuButtons(title: "Moments", icon: "moments", showMenu: $showMenu)
                        sideMenuButtons(title: "Purchases", icon: "cart", showMenu: $showMenu)
                        sideMenuButtons(title: "Monitization", icon: "money", showMenu: $showMenu)
                        
                    }
                    .padding(.bottom,35)
                    
                    Divider()
                    
                    VStack(spacing: 35) {
                        sideMenuButtons(title: "Settings and privacy", icon: "profile", showMenu: $showMenu)
                        sideMenuButtons(title: "Help Center", icon: "profile", showMenu: $showMenu)
                        
                    }
                    .padding(.top,35)
                }
            }
            .padding()
            .padding(.top,35)
            .padding(.leading)
            
            Divider()
            
            VStack(spacing: 0) {
                HStack {
                    
                    Button(action: {}, label: {
                        Image(systemName: "lightbulb")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.primary)
                    })
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: "qrcode")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 22, height: 22)
                            .foregroundColor(.primary)
                    })
                }
            }
            .padding()
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(width: getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(
            Color.primary
                .opacity(0.04)
                .edgesIgnoringSafeArea(.all)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}

struct sideMenuButtons: View {
    
    //Variables
    var title: String
    var icon: String
    @Binding var showMenu: Bool
    
    var body: some View {
        
        Button(action: {
            showMenu = false
            
        }, label: {
            HStack(spacing: 15) {
                Image(icon)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 22, height: 22)
                
                Text(title)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
        })
    }
}

