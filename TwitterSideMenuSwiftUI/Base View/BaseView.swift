//
//  BaseView.swift
//  TwitterSideMenuSwiftUI
//
//  Created by Mac on 11/09/2021.
//

import SwiftUI

struct BaseView: View {
    
    //MARK:- Variables
    @State var showMenu = false
    @State var currentSelection = "Home"
    @State var offset: CGFloat = 0
    @GestureState var gestureOffset: CGFloat = 0
    
    //MARK:- initilizer
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    //MARK:- body
    var body: some View {
        
        let sidebarWidth = getRect().width - 90
        
        NavigationView {
            
            HStack(spacing: 0) {
                
                SideMenu(showMenu: $showMenu)
                
                VStack {
                    
                    TabView(selection: $currentSelection) {
                        Home(showMenu: $showMenu)
                            .navigationBarHidden(true)
                            .navigationBarTitleDisplayMode(.inline)
                            .tag("Home")
                        
                        Text("Search")
                            .navigationBarHidden(true)
                            .navigationBarTitleDisplayMode(.inline)
                            .tag("Search")
                        
                        Text("Notifications")
                            .navigationBarHidden(true)
                            .navigationBarTitleDisplayMode(.inline)
                            .tag("Notifications")
                        
                        Text("Messages")
                            .navigationBarHidden(true)
                            .navigationBarTitleDisplayMode(.inline)
                            .tag("Messages")
                    }
                    
                    VStack(spacing: 0) {
                        
                        Divider()
                        
                        HStack(spacing: 0) {
                            
                            TabbarButton(icon: "Home", currentSelection: $currentSelection)
                            TabbarButton(icon: "Search", currentSelection: $currentSelection)
                            TabbarButton(icon: "Notifications", currentSelection: $currentSelection)
                            TabbarButton(icon: "Messages", currentSelection: $currentSelection)
                            
                        }
                        .padding(.top,15)
                    }
                }
                .frame(width: getRect().width)
                .overlay(
                    Rectangle()
                        .fill(
                            Color.primary.opacity(Double(offset/sidebarWidth/5))
                        )
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showMenu.toggle()
                        }
                )
            }
            .frame(width: getRect().width + sidebarWidth)
            .offset(x: -sidebarWidth/2)
            .offset(x: offset)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .gesture(
                DragGesture()
                    .updating($gestureOffset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded(onEnd(value:))
            )
        }
        .animation(.easeInOut)
        .onChange(of: showMenu, perform: { value in
            if showMenu {
                offset = sidebarWidth
            } else {
                offset = 0
            }
        })
        .onChange(of: gestureOffset, perform: { value in
            onchange()
        })
    }
    
    func onchange() {
        offset = (gestureOffset != 0) ? gestureOffset : offset
    }
    
    func onEnd(value: DragGesture.Value) {
        
        let sidebarWidth = getRect().width - 90
        
        withAnimation {
            if value.translation.width > 0 {
                offset = sidebarWidth
                showMenu = true
                
            } else {
                offset = 0
                showMenu = false
                
            }
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}


struct TabbarButton: View {
    
    var icon: String
    @Binding var currentSelection: String
    
    var body: some View {
        
        Button(action: {
            withAnimation {
                currentSelection = icon
                
            }
        }, label: {
            Image(icon)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fill)
                .frame(width: 23, height: 22)
                .foregroundColor(currentSelection == icon ? .primary : .gray)
                .frame(maxWidth: .infinity)
            
        })
    }
}
