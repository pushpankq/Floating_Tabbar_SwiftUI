//
//  ContentView.swift
//  FloatingTabbar
//
//  Created by Puspank Kumar on 16/05/20.
//  Copyright © 2020 Puspank Kumar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var selected = 0
    
    var body: some View {
    
        ZStack(alignment: .bottom){
            VStack{
                if self.selected == 0{
                    NavigationView{
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(spacing: 15){
                                ForEach(1...8,id: \.self){i in
                                    Image("p\(i)")
                                        .resizable()
                                        .frame(height: 250)
                                        .cornerRadius(15)
                                }
                                
                            }.padding()
                            .navigationBarTitle("Home",displayMode: .large)
                        }
                        .edgesIgnoringSafeArea(.bottom)
                    }
                }
                else if self.selected == 1{
                    GeometryReader{_ in
                        Text("Wishlist")
                    }
                }
                else{
                    GeometryReader{_ in
                        Text("Cart")
                    }
                }
                
            }.background(Color("Color")
            .edgesIgnoringSafeArea(.all))
            FloatingTabbar(selected: self.$selected)
        }
    }
}

struct FloatingTabbar: View {
    @Binding var selected: Int
    @State var expand = false
    
    var body: some View {
        
        HStack{
            Spacer(minLength: 0)
            HStack {
                
                if !self.expand {
                    Button(action: {
                        self.expand.toggle()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                            .padding()
                    }
                    
                } else {
                    
                    Button(action: {
                         self.selected = 0
                     }) {
                         Image("Home")
                             .foregroundColor(self.selected == 0 ? .black : .gray)
                             .padding(.horizontal)
                     }
                     Spacer(minLength: 15)
                     
                     Button(action: {
                         self.selected = 1
                         
                     }) {
                         Image("Wishlist")
                             .foregroundColor(self.selected == 1 ? .black : .gray)
                             .padding(.horizontal)
                     }
                     Spacer(minLength: 15)

                     Button(action: {
                         self.selected = 2

                     }) {
                         Image("Cart")
                             .foregroundColor(self.selected == 2 ? .black : .gray)
                             .padding(.horizontal)
                     }
                     Spacer(minLength: 15)
                }
            }
            .padding(.vertical, self.expand ? 20 : 8)
            .padding(.horizontal, self.expand ? 35 : 8)
            .background(Color.white)
            .clipShape(Capsule())
            .padding(22)
            .onLongPressGesture {
                self.expand.toggle()
            }
            .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6))
        }
    }
}
